import 'package:equatable/equatable.dart';

class SearchEnity extends Equatable {
  final int id;
  final String userName;
  final String userImg;

  const SearchEnity({
    this.id,
    this.userImg,
    this.userName,
  });

  @override
  List<Object> get props => [id];
}
