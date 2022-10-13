import 'package:adviser/domain/entities/advise_entity.dart';
import 'package:adviser/domain/failures/failures.dart';
import 'package:adviser/domain/usecases/adviser_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'adviser_event.dart';
part 'adviser_state.dart';

class AdviserBloc extends Bloc<AdviserEvent, AdviserState> {
  final AdviserUseCases useCases;

  AdviserBloc({required this.useCases}) : super(AdviserInitial()) {
    on<AdviserRequestedEvent>((event, emit) async {
      emit(AdviserStateLoading());
      try {
        final Either<AdviseEntity, Failure> adviseOrFailure =
            await useCases.getAdvise();

        adviseOrFailure.fold(
            (advise) => emit(AdviserStateLoaded(advise: advise.advise)),
            (failure) => emit(AdviserStateError(
                errorMessage: _mapFailureToMessage(failure))));
      } catch (e) {
        emit(AdviserStateError(
            errorMessage: _mapFailureToMessage(GeneralFailure())));
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'No connection to the Internet. Please try again.';
      case GeneralFailure:
        return 'Ups, something has gone wrong. Please try again.';
      default:
        return 'Ups, something has gone wrong. Please try again.';
    }
  }
}
