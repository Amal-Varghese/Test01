import 'package:Test01/domain/entity/repos_entity.dart';

class RepoListModel extends ReposEntity {
  final int id;
  final String name;
  final String htmlUrl;
  final String description;

  const RepoListModel({
    this.id,
    this.name,
    this.htmlUrl,
    this.description,
  }) : super(
          desc: description,
          id: id,
          repoName: name,
          url: htmlUrl,
        );

  factory RepoListModel.fromJson(Map<String, dynamic> json) {
    return RepoListModel(
      id: json['id'],
      name: json['name'],
      htmlUrl: json['html_url'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['html_url'] = this.htmlUrl;
    data['description'] = this.description;
    return data;
  }
}
