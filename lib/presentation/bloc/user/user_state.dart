import 'package:Test01/domain/entity/user_entity.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoadInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoadError extends UserState {
  final String message;
  const UserLoadError({this.message});
}

class UserLoadSucess extends UserState {
  final UserEntity user;

  const UserLoadSucess({this.user});
}
