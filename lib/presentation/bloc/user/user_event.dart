import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserLoadEvent extends UserEvent {
  final String userName;
  const UserLoadEvent({this.userName});
}
