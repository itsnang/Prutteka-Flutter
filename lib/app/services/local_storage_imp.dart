import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prutteka_flutter/constants/constant.dart';
import 'package:prutteka_flutter/app/services/local_storage_service.dart';

class LocalStorageImplement implements LocalStorageDataSource {
  final _prefs = Hive.box(Const.hiveKey);

  static Future<void> initDb() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    await Hive.openBox(Const.hiveKey);
  }

  @override
  Future<void> put(String key, data) async {
    await _prefs.put(key, data);
  }

  @override
  read(String key) {
    return _prefs.get(key);
  }

  @override
  Future<void> delete(String key) async {
    if (read(key) != null) {
      await _prefs.delete(key);
    }
  }

  @override
  createJsonData(String key, data) async {
    if (read(key) != null) {
      await _prefs.delete(key);
    }
    await put(key, jsonEncode(data));
  }

  @override
  readJsonData(String key) {
    return _prefs.get(key) != null ? jsonDecode(_prefs.get(key)) : null;
  }

  @override
  getDynamicDta(String key, bool isJson) async {
    return isJson
        ? ((readJsonData(key) != null) ? readJsonData(key) : null)
        : ((read(key) != null) ? read(key) : null);
  }
}
