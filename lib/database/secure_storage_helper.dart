import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class SecureStorageHelper {

  final FlutterSecureStorage _storage;

  SecureStorageHelper._internal(this._storage);

  static final SecureStorageHelper _singleton = SecureStorageHelper._internal(FlutterSecureStorage());

  factory SecureStorageHelper() {
    return _singleton;
  }

  factory SecureStorageHelper.getInstance() {
    return _singleton;
  }
}
