import 'package:hive/hive.dart';

abstract class LocalStorageDataSource {
  LocalStorageDataSource();

  dynamic read(String key);
  Future<void> put(String key, dynamic data);
  Future<void> delete(String key);

  dynamic createJsonData(String key, dynamic data);
  dynamic readJsonData(String key);
  dynamic getDynamicDta(String key, bool isJson);
}
