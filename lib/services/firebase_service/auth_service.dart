import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class AuthService {
  static final _firestore = FirebaseFirestore.instance;

  static String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  static Future<void> register(String username, String password) async {
    print('Регистрация пользователя: $username');
    final hashedPassword = _hashPassword(password);

    final userDoc = await _firestore.collection('users').doc(username).get();
    if (userDoc.exists) {
      throw Exception('Пользователь с таким логином уже существует');
    }

    await _firestore.collection('users').doc(username).set({
      'username': username,
      'password': hashedPassword,
      'createdAt': DateTime.now().toIso8601String(),
    });
    print('Пользователь $username успешно зарегистрирован');
  }


  static Future<bool> login(String username, String password) async {
    print('Проверка входа для пользователя: $username');
    final hashedPassword = _hashPassword(password);

    final userDoc = await _firestore.collection('users').doc(username).get();
    if (!userDoc.exists) {
      print('Пользователь $username не найден');
      return false;
    }

    final data = userDoc.data()!;
    final storedPassword = data['password'] as String;
    final result = storedPassword == hashedPassword;
    print('Результат входа: $result');
    return result;
  }
}