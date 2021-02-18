import 'package:equatable/equatable.dart';

abstract class ReposEvent extends Equatable {
  const ReposEvent();

  @override
  List<Object> get props => [];
}

class ReposLoadEvent extends ReposEvent {
  final String userName;
  const ReposLoadEvent({this.userName});
}
