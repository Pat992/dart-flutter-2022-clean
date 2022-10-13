import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'adviser_event.dart';
part 'adviser_state.dart';

class AdviserBloc extends Bloc<AdviserEvent, AdviserState> {
  // TODO Delete again
  Future sleep1() {
    return Future.delayed(
        const Duration(seconds: 2), () => "I am advise, here to advise you");
  }

  AdviserBloc() : super(AdviserInitial()) {
    on<AdviserEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AdviserRequestedEvent>((event, emit) async {
      emit(AdviserStateLoading());
      try {
        // TODO actually get values from api
        String output = await sleep1();
        emit(AdviserStateLoaded(advise: output));
      } catch (e) {
        emit(AdviserStateError());
      }
    });
  }
}
