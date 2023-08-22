import 'package:prutteka_flutter/data/models/event_model.dart';
import 'package:prutteka_flutter/domain/entities/paging.dart';

class PagingModel extends Paging {
  PagingModel({required this.totalResults, required this.events})
      : super(totalResults: totalResults, events: events);

  final int totalResults;
  final List<EventModel> events;

  @override
  factory PagingModel.fromJson(Map<String, dynamic> json) => PagingModel(
        totalResults: List.from(json['data']).length,
        events: List.from(
          json['data'].map((x) => EventModel.fromJson(x)),
        ),
      );
}
