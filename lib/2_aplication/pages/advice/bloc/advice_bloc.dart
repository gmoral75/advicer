import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdvicerBloc extends Bloc<AdviceEvent, AdvicerState> {
  AdvicerBloc() : super(AdviceInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviceStateLoading());
      // Exceute business logic
      debugPrint('got advice');
      emit(AdviceStateLoaded(advice: 'fake get advice triggered!'));
      //emit(AdviceStateError(message: "We have an error!"));
    });
  }
}
