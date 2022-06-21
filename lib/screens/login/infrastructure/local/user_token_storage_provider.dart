import 'package:hive/hive.dart';

const userTokenBoxName = 'user_token';

class UserTokenStorageProvider {
  Future<void> saveUserToken(String userToken) async {
    final box = await _openBox();
    await box.put(0, userToken);
  }

  Future<Box<String>> _openBox() async {
    if (Hive.isBoxOpen(userTokenBoxName)) {
      return Hive.box<String>(userTokenBoxName);
    }

    return await Hive.openBox<String>(userTokenBoxName);
  }

  Future<bool> tokenExists() async {
    final box = await _openBox();
    return box.get(0) != null;
  }
}
