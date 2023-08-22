import 'package:get/get.dart';
import 'package:prutteka_flutter/data/repositories/event_repository.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(() => EventRepositoryIml());
  }
}
