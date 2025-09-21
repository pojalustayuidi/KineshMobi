import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class UserRepository {
  static const String _userIdKey = "user_unique_id";
  final SharedPreferences _prefs;
  UserRepository(this._prefs);
  Future<String> getOrCreateUserId() async {
    final String? existingId = _prefs.getString(_userIdKey);

    if (existingId != null && existingId.isNotEmpty){
      return existingId;
    }
    else {
      const uuid = Uuid();
      final newUserId = uuid.v4();
      await _prefs.setString(_userIdKey, newUserId);
      return newUserId;
    }
  }
}