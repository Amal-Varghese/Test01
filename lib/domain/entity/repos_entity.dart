import 'package:equatable/equatable.dart';

class ReposEntity extends Equatable {
  final int id;
  final String repoName;
  final String url;
  final String desc;

  const ReposEntity({
    this.desc,
    this.id,
    this.repoName,
    this.url,
  });

  @override
  List<Object> get props => [id];
}
