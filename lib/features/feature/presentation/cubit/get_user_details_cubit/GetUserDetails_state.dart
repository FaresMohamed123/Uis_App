part of 'GetUserDetails_cubit.dart';

@immutable
sealed class GetUserDetailsState {}

final class CubitInitial extends GetUserDetailsState {}

final class GetUserDetailsLoading extends GetUserDetailsState {}

final class GetUserDetailsSuccess extends GetUserDetailsState {
  final GetUserDetailsModel getUserDetailsModel;
  GetUserDetailsSuccess(this.getUserDetailsModel);
}

class GetuserdetailsError extends GetUserDetailsState {

 final String error;

GetuserdetailsError(this.error);

}

