import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';

class EmailVerificationService {
  static final _firestore = FirebaseFirestore.instance;
  static final _functions = FirebaseFunctions.instance;

  static String generateCode() {
    final random = Random();
    return List.generate(6, (_) => random.nextInt(10)).join();
  }

  static Future<void> sendCodeToEmail(String email) async {
    final code = generateCode();
    final now = DateTime.now();

    await _firestore.collection('email_verification_codes').doc(email).set({
      'code': code,
      'timestamp': now.toIso8601String(),
    });

    final callable = _functions.httpsCallable('sendVerificationCode');
    final result = await callable.call({'email': email, 'code': code});

    if (result.data['success'] != true) {
      throw Exception(result.data['error'] ?? 'Ошибка отправки кода');
    }
  }

  static Future<bool> verifyCode(String email, String code) async {
    final doc = await _firestore.collection('email_verification_codes').doc(email).get();
    if (!doc.exists) return false;

    final data = doc.data()!;
    final storedCode = data['code'] as String;
    final timestamp = DateTime.parse(data['timestamp'] as String);
    final now = DateTime.now();

    if (now.difference(timestamp).inMinutes > 10) return false;

    return storedCode == code;
  }
}