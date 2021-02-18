import 'package:Test01/domain/entity/repos_entity.dart';
import 'package:Test01/domain/entity/search_entity.dart';
import 'package:Test01/domain/entity/user_entity.dart';

abstract class RemoteDataSource {
  Future<UserEntity> getUser(String userName);
  Future<List<ReposEntity>> getUserRepos(String userName);
  Future<List<SearchEnity>> getUsers(String userName);
}
