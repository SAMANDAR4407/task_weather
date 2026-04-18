import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../common/data/repository/repository_impl.dart';
import '../../../common/domain/entities/entities.dart';
import '../../../core/core.dart';

part 'cities_event.dart';
part 'cities_state.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  final _repo = RepositoryImpl();
  CitiesBloc() : super(CitiesState()) {
    on<CitiesEvent>((event, emit) async {
      switch(event) {
        case FetchData():
          await _onFetchData(event, emit);
      }
    });
  }

  Future<void> _onFetchData(FetchData event, Emitter emit) async {
    if (state.status == EnumStatus.loading) return;
    emit(state.copyWith(status: EnumStatus.loading));
    try {
      final data = await _repo.fetchData(event.query);
      data.fold(
            (l) => emit(state.copyWith(status: EnumStatus.fail)),
            (r) => emit(state.copyWith(status: EnumStatus.success, data: r)),
      );
    } catch (e) {
      emit(state.copyWith(status: EnumStatus.fail));
    }
  }
}
