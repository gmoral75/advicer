import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:advicer/1_domain/usecases/advice_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceCubitState> {
  AdviceCubit() : super(AdviceInitial());
  final AdviceUseCases adviceUseCases = AdviceUseCases();
  // could also use other usecases

  void adviceRequested() async {
     emit(AdviceStateLoading());
      // Exceute business logic
      final AdviceEntity advice = await adviceUseCases.getAdvice();

      debugPrint('got cubit advice');
      emit(AdviceStateLoaded(advice: advice.advice));
      //emit(AdviceStateError(message: "We have an error!"));
  }
}
