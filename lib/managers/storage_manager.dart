import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageManager {
  static final FlutterSecureStorage instance = const FlutterSecureStorage();

  get storage => instance;

  Future<void> deleteAll() {
    return instance.deleteAll();
  }
}
