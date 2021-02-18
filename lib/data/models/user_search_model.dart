import 'package:Test01/domain/entity/search_entity.dart';

class UserSearchModel extends SearchEnity {
  final String login;
  final int id;
  final String avatarUrl;

  const UserSearchModel({
    this.login,
    this.id,
    this.avatarUrl,
  }) : super(
          id: id,
          userName: login,
          userImg: avatarUrl,
        );

  factory UserSearchModel.fromJson(Map<String, dynamic> json) {
    return UserSearchModel(
      login: json['login'],
      id: json['id'],
      avatarUrl: json['avatar_url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['id'] = this.id;
    data['avatar_url'] = this.avatarUrl;

    return data;
  }
}
