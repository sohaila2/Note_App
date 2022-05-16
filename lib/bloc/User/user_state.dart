part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {
  // ToDo :: Create userHub to send to ui
  final UserHub? userHub;

  UserSuccessState(this.userHub);

}

class UserErrorState extends UserState {}
