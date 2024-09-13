part of 'resetpin_cubit.dart';

@immutable
sealed class ResetPinState {}

final class ResetPinInitial extends ResetPinState {}

final class ResetPinLoading extends ResetPinState {}

final class ResetPinSuccess extends ResetPinState {

}

final class ResetPinFailure extends ResetPinState {
  final String message;
  ResetPinFailure({required this.message});
}
