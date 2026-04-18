import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_weather/common/data/repository/repository_impl.dart';
import 'package:task_weather/common/domain/entities/entities.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _repo = RepositoryImpl();
  HomeBloc() : super(HomeState()) {
    on<HomeEvent>((event, emit) async {
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
