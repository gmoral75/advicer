import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdvicerBloc extends Bloc<AdviceEvent, AdvicerState> {
  AdvicerBloc() : super(AdviceInitial()) {
    
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviceStateLoading());

      // Exceute business logic
      // for example get and advice
      debugPrint('fake get advice triggered!');
      await Future.delayed(const Duration(seconds: 3), () {});
      debugPrint('got advice');
      emit(AdviceStateLoaded(advice: "Fake advice to test"));
      //emit(AdviceStateError(message: "We have an error!"));
    });
  }
}
