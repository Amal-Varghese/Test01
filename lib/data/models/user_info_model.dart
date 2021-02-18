import 'package:Test01/domain/entity/user_entity.dart';

class UserInfoModel extends UserEntity {
  final String login;
  final int id;
  final String name;
  final String location;
  final String bio;
  final int publicRepos;
  final int followers;
  final int following;

  UserInfoModel({
    this.login,
    this.id,
    this.name,
    this.location,
    this.bio,
    this.publicRepos,
    this.followers,
    this.following,
  }) : super(
          bio: bio,
          followers: followers,
          following: following,
          id: id,
          location: location,
          name: name,
          public_repos: publicRepos,
          userName: login,
        );

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      login: json['login'],
      id: json['id'],
      name: json['name'],
      location: json['location'],
      bio: json['bio'],
      publicRepos: json['public_repos'],
      followers: json['followers'],
      following: json['following'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['id'] = this.id;
    data['name'] = this.name;
    data['location'] = this.location;
    data['bio'] = this.bio;
    data['public_repos'] = this.publicRepos;
    data['followers'] = this.followers;
    data['following'] = this.following;
    return data;
  }
}
