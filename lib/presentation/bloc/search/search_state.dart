import 'package:Test01/domain/entity/repos_entity.dart';
import 'package:Test01/domain/entity/search_entity.dart';
import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchLoadInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoadError extends SearchState {
  final String message;
  const SearchLoadError({this.message});
}

class SearchLoadSucess extends SearchState {
  final List<SearchEnity> users;

  const SearchLoadSucess({this.users});
}
