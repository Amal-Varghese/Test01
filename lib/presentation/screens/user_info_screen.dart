import 'package:Test01/domain/entity/user_entity.dart';
import 'package:flutter/material.dart';

class UserInfoScreen extends StatefulWidget {
  UserEntity userEntity;
  UserInfoScreen({this.userEntity});
  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(width: 140.0,height: 140.0,child: Image.network(widget.userEntity.),)
          Text(widget.userEntity.name),
          Text(widget.userEntity.userName),
          Text(widget.userEntity.location),
          Text('No. repos${widget.userEntity.public_repos}'),
          Text('Followers - ${widget.userEntity.followers}'),
          Text('Following - ${widget.userEntity.following}'),
        ],
      ),
    );
  }
}
