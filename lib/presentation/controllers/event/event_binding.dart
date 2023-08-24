import 'package:get/get.dart';
import 'package:prutteka_flutter/presentation/controllers/event/event_controller.dart';
import 'package:prutteka_flutter/data/repositories/event_repository.dart';
import 'package:prutteka_flutter/domain/fetch_event_use_case.dart';

class EventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FetchEventUseCase(Get.find<EventRepositoryIml>()));
    Get.lazyPut(() => EventController(Get.find()));
  }
}
