import 'package:adviser/domain/usecases/adviser_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'adviser_event.dart';
part 'adviser_state.dart';

class AdviserBloc extends Bloc<AdviserEvent, AdviserState> {
  final useCases = AdviserUseCases();

  AdviserBloc() : super(AdviserInitial()) {
    on<AdviserRequestedEvent>((event, emit) async {
      emit(AdviserStateLoading());
      try {
        final advise = await useCases.getAdvise();
        emit(AdviserStateLoaded(advise: advise.advise));
      } catch (e) {
        emit(AdviserStateError());
      }
    });
  }
}
