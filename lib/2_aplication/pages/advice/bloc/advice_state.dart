part of 'advice_bloc.dart';

@immutable
abstract class AdvicerState {}

class AdviceInitial extends AdvicerState {}

class AdviceStateLoading extends AdvicerState {}

class AdviceStateLoaded extends AdvicerState {
  final String advice;
  AdviceStateLoaded({required this.advice});
}

class AdviceStateError extends AdvicerState {
   final String message;
  AdviceStateError({required this.message});
}