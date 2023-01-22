part of 'advice_bloc.dart';

@immutable
abstract class AdvicerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AdviceInitial extends AdvicerState {}

class AdviceStateLoading extends AdvicerState {}

class AdviceStateLoaded extends AdvicerState {
  final String advice;
  AdviceStateLoaded({required this.advice});

  @override
  List<Object?> get props => [advice];
}

class AdviceStateError extends AdvicerState {
  final String message;
  AdviceStateError({required this.message});

  @override
  List<Object?> get props => [message];
}
