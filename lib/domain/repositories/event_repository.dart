import 'package:prutteka_flutter/domain/entities/paging.dart';

abstract class EventRepository {
  Future<Paging> fetchEvents(int page, int limit);
}
