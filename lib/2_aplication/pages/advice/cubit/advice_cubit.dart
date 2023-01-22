import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceCubitState> {
  AdviceCubit() : super(AdviceInitial());

  void adviceRequested() async {
     emit(AdviceStateLoading());
      // Exceute business logic
      debugPrint('got cubit advice');
      emit(const AdviceStateLoaded(advice: 'fake get advice triggered!'));
      //emit(AdviceStateError(message: "We have an error!"));
  }
}
