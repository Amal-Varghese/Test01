import 'package:Test01/domain/entity/repos_entity.dart';
import 'package:equatable/equatable.dart';

abstract class ReposState extends Equatable {
  const ReposState();

  @override
  List<Object> get props => [];
}

class ReposLoadInitial extends ReposState {}

class ReposLoading extends ReposState {}

class ReposLoadError extends ReposState {
  final String message;
  const ReposLoadError({this.message});
}

class ReposLoadSucess extends ReposState {
  final List<ReposEntity> repositories;

  const ReposLoadSucess({this.repositories});
}
