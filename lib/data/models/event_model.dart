import 'package:json_annotation/json_annotation.dart';
import 'package:prutteka_flutter/domain/entities/event.dart';
part 'event_model.g.dart';

@JsonSerializable()
class EventModel extends Event {
  EventModel({
    this.type,
    this.id,
    this.attributes,
    this.relationships,
  }) : super(
            attributes: attributes,
            id: id,
            relationships: relationships,
            type: type);

  @override
  String? type;
  @override
  String? id;
  @override
  Attributes? attributes;
  @override
  Relationships? relationships;

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}
