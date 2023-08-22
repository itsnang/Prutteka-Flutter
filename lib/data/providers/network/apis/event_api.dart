import '../api_endpoint.dart';
import '../api_provider.dart';
import '../api_request_representable.dart';

class EventAPI implements APIRequestRepresentable {
  int? page;
  int? limit;

  EventAPI._({this.page, this.limit});

  EventAPI.fetchEvents(int page, int limit) : this._(page: page, limit: limit);

  @override
  String get endpoint => APIEndpoint.pruttekaapi;

  @override
  String get path => "/events";

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  @override
  Map<String, String> get headers => {"Content-Type": "application/json"};

  @override
  Map<String, String> get query {
    return {"page[offset]": "${(page ?? 1) - 1}", "page[limit]": "$limit"};
  }

  @override
  get body => null;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
