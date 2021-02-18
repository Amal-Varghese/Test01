import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchLoadEvent extends SearchEvent {
  final String userName;
  const SearchLoadEvent({this.userName});
}
