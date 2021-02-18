import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userName;
  final int id;
  final String name;
  final String location;
  final String bio;
  final int followers;
  final int following;
  final int public_repos;

  const UserEntity({
    this.bio,
    this.followers,
    this.following,
    this.id,
    this.location,
    this.name,
    this.public_repos,
    this.userName,
  });

  @override
  List<Object> get props => [id];
}
