import 'dart:convert';

class Event {
  String? type;
  String? id;
  Attributes? attributes;
  Relationships? relationships;

  Event({
    this.type,
    this.id,
    this.attributes,
    this.relationships,
  });
}

class Attributes {
  Detail name;
  String type;
  List<String> categories;
  String imageSrc;
  Detail detail;
  Date date;
  List<Time> times;
  List<Location> locations;
  List<dynamic> schedules;
  List<JoinMethod> joinMethods;
  List<DynamicContent> dynamicContents;
  DateTime createdAt;

  Attributes({
    required this.name,
    required this.type,
    required this.categories,
    required this.imageSrc,
    required this.detail,
    required this.date,
    required this.times,
    required this.locations,
    required this.schedules,
    required this.joinMethods,
    required this.dynamicContents,
    required this.createdAt,
  });

  factory Attributes.fromRawJson(String str) =>
      Attributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        name: Detail.fromJson(json["name"]),
        type: json["type"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        imageSrc: json["image_src"],
        detail: Detail.fromJson(json["detail"]),
        date: Date.fromJson(json["date"]),
        times: List<Time>.from(json["times"].map((x) => Time.fromJson(x))),
        locations: List<Location>.from(
            json["locations"].map((x) => Location.fromJson(x))),
        schedules: List<dynamic>.from(json["schedules"].map((x) => x)),
        joinMethods: List<JoinMethod>.from(
            json["join_methods"].map((x) => JoinMethod.fromJson(x))),
        dynamicContents: List<DynamicContent>.from(
            json["dynamic_contents"].map((x) => DynamicContent.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "type": type,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "image_src": imageSrc,
        "detail": detail.toJson(),
        "date": date.toJson(),
        "times": List<dynamic>.from(times.map((x) => x.toJson())),
        "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
        "schedules": List<dynamic>.from(schedules.map((x) => x)),
        "join_methods": List<dynamic>.from(joinMethods.map((x) => x.toJson())),
        "dynamic_contents":
            List<dynamic>.from(dynamicContents.map((x) => x.toJson())),
        "created_at": createdAt.toIso8601String(),
      };
}

class Date {
  DateTime startDate;
  DateTime endDate;

  Date({
    required this.startDate,
    required this.endDate,
  });

  factory Date.fromRawJson(String str) => Date.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
      );

  Map<String, dynamic> toJson() => {
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
      };
}

class Detail {
  String en;
  String km;

  Detail({
    required this.en,
    required this.km,
  });

  factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        en: json["en"],
        km: json["km"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "km": km,
      };
}

class DynamicContent {
  Detail name;
  List<Item> items;
  String id;

  DynamicContent({
    required this.name,
    required this.items,
    required this.id,
  });

  factory DynamicContent.fromRawJson(String str) =>
      DynamicContent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DynamicContent.fromJson(Map<String, dynamic> json) => DynamicContent(
        name: Detail.fromJson(json["name"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "_id": id,
      };
}

class Item {
  String imageSrc;
  Detail name;
  Detail detail;
  String id;

  Item({
    required this.imageSrc,
    required this.name,
    required this.detail,
    required this.id,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        imageSrc: json["image_src"],
        name: Detail.fromJson(json["name"]),
        detail: Detail.fromJson(json["detail"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "image_src": imageSrc,
        "name": name.toJson(),
        "detail": detail.toJson(),
        "_id": id,
      };
}

class JoinMethod {
  Detail name;
  String link;
  String id;

  JoinMethod({
    required this.name,
    required this.link,
    required this.id,
  });

  factory JoinMethod.fromRawJson(String str) =>
      JoinMethod.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory JoinMethod.fromJson(Map<String, dynamic> json) => JoinMethod(
        name: Detail.fromJson(json["name"]),
        link: json["link"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "link": link,
        "_id": id,
      };
}

class Location {
  String name;
  String address;
  String url;
  Latlng latlng;
  String type;
  String placeId;
  String imageSrc;
  String id;

  Location({
    required this.name,
    required this.address,
    required this.url,
    required this.latlng,
    required this.type,
    required this.placeId,
    required this.imageSrc,
    required this.id,
  });

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        address: json["address"],
        url: json["url"],
        latlng: Latlng.fromJson(json["latlng"]),
        type: json["type"],
        placeId: json["place_id"],
        imageSrc: json["image_src"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "url": url,
        "latlng": latlng.toJson(),
        "type": type,
        "place_id": placeId,
        "image_src": imageSrc,
        "_id": id,
      };
}

class Latlng {
  double lat;
  double lng;

  Latlng({
    required this.lat,
    required this.lng,
  });

  factory Latlng.fromRawJson(String str) => Latlng.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Latlng.fromJson(Map<String, dynamic> json) => Latlng(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Time {
  DateTime date;
  DateTime startTime;
  DateTime endTime;
  String id;

  Time({
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.id,
  });

  factory Time.fromRawJson(String str) => Time.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        date: DateTime.parse(json["date"]),
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "start_time": startTime.toIso8601String(),
        "end_time": endTime.toIso8601String(),
        "_id": id,
      };
}

class Relationships {
  Organizer organizer;

  Relationships({
    required this.organizer,
  });

  factory Relationships.fromRawJson(String str) =>
      Relationships.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Relationships.fromJson(Map<String, dynamic> json) => Relationships(
        organizer: Organizer.fromJson(json["organizer"]),
      );

  Map<String, dynamic> toJson() => {
        "organizer": organizer.toJson(),
      };
}

class Organizer {
  Data? data;

  Organizer({
    required this.data,
  });

  factory Organizer.fromRawJson(String str) =>
      Organizer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Organizer.fromJson(Map<String, dynamic> json) => Organizer(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  String type;
  String id;

  Data({
    required this.type,
    required this.id,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        type: json["type"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
      };
}
