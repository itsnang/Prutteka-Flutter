import 'package:prutteka_flutter/domain/entities/event.dart';

class Paging {
  Paging({required this.totalResults, required this.events});

  int totalResults;
  List<Event> events;
}
