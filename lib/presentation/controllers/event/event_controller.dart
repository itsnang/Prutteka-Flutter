import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:prutteka_flutter/domain/entities/event.dart';
import 'package:prutteka_flutter/domain/entities/paging.dart';
import 'package:prutteka_flutter/domain/fetch_event_use_case.dart';
import 'package:tuple/tuple.dart';

class EventController extends GetxController {
  EventController(this._fetchEventUseCase);
  final FetchEventUseCase _fetchEventUseCase;
  int _currentPage = 1;
  final int _limit = 8;
  final _paging = Rx<Paging?>(null);

  var events = RxList<Event>([]);
  var loading = false.obs;
  var ended = false.obs;

  fetchData() async {
    // if (events.isNotEmpty) return;
    loading.value = true;
    _currentPage = 1;

    final newPaging =
        await _fetchEventUseCase.execute(Tuple2(_currentPage, _limit));

    events.assignAll(newPaging.events);
    _paging.value = newPaging;
    loading.value = false;
  }

  loadMore() async {
    if (loading.value || ended.value) return;
    loading.value = true;
    _currentPage++;
    print('========> controller');
    final newPaging =
        await _fetchEventUseCase.execute(Tuple2(_currentPage, _limit));

    events.addAll(newPaging.events);
    loading.value = false;
    if (newPaging.totalResults == 0) ended.value = true;
  }
}
