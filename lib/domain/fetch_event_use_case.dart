import 'package:prutteka_flutter/app/core/usecases/param_usecase.dart';
import 'package:prutteka_flutter/domain/entities/paging.dart';
import 'package:prutteka_flutter/domain/repositories/event_repository.dart';
import 'package:tuple/tuple.dart';

class FetchEventUseCase extends ParamUseCase<Paging, Tuple2<int, int>> {
  final EventRepository _repo;
  FetchEventUseCase(this._repo);

  @override
  Future<Paging> execute(Tuple2<int, int> params) {
    return _repo.fetchEvents(params.item1, params.item2);
  }
}
