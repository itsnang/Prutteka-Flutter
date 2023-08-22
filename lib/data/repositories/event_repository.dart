import 'package:prutteka_flutter/data/models/paging_model.dart';
import 'package:prutteka_flutter/data/providers/network/apis/event_api.dart';
import 'package:prutteka_flutter/domain/repositories/event_repository.dart';

class EventRepositoryIml extends EventRepository {
  @override
  Future<PagingModel> fetchEvents(int page, int limit) async {
    final response = await EventAPI.fetchEvents(page, limit).request();
    return PagingModel.fromJson(response);
  }
}
