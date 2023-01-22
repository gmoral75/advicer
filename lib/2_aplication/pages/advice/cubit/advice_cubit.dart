import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:advicer/1_domain/failures/failures.dart';
import 'package:advicer/1_domain/usecases/advice_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'advice_state.dart';

const generalFailureMessage = 'Ups, somethin gone wrong, please try aain';
const cacheFailureMessage = 'Ups, Cache Error, please try aain';
const serverFailureMessage = 'Ups, API Error, please try aain';

class AdviceCubit extends Cubit<AdviceCubitState> {
  AdviceCubit({required this.adviceUseCases}) : super(AdviceInitial());
  final AdviceUseCases adviceUseCases;
  
  // could also use other usecases

  void adviceRequested() async {
    emit(AdviceStateLoading());
    // Exceute business logic
    final failureOrAdvice = await adviceUseCases.getAdvice();

    failureOrAdvice.fold(
        (failure) => emit(AdviceStateError(message: _mapFailureToMessage(failure))),
        (advice) => emit(AdviceStateLoaded(advice: advice.advice)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
