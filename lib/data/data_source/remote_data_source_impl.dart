import 'package:Test01/core/api/api_endpoints.dart';
import 'package:Test01/core/api/api_provider.dart';
import 'package:Test01/core/api/generic_api_response.dart';
import 'package:Test01/data/models/repo_list_model.dart';
import 'package:Test01/data/models/user_info_model.dart';
import 'package:Test01/data/models/user_search_model.dart';
import 'package:Test01/domain/data_source/remote_data_source.dart';
import 'package:Test01/domain/entity/user_entity.dart';
import 'package:Test01/domain/entity/search_entity.dart';
import 'package:Test01/domain/entity/repos_entity.dart';
import 'package:dio/dio.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  Dio dio;

  RemoteDataSourceImpl({this.dio});

  @override
  Future<UserEntity> getUser(String userName) async {
    ApiProvider _apiProvider = ApiProvider(dio: dio);
    GenericApiResponse apiResponse = await _apiProvider.create(
      url: USER_INFO_URL + userName,
    );
    if (apiResponse is ApiSuccesResponse) {
      final reposne = UserInfoModel.fromJson(apiResponse.responseBody);
      return reposne;
    } else if (apiResponse is ApiErrorResponse) {
      throw apiResponse.errorMessage;
    }
    return null;
  }

  @override
  Future<List<ReposEntity>> getUserRepos(String userName) async {
    ApiProvider _apiProvider = ApiProvider(dio: dio);
    GenericApiResponse apiResponse = await _apiProvider.create(
      url: REPOS_URL.replaceAll('name', userName),
    );
    if (apiResponse is ApiSuccesResponse) {
      List<ReposEntity> repos = List();
      apiResponse.responseBody.forEach((element) {
        repos.add(RepoListModel.fromJson(element));
      });
      return repos;
    } else if (apiResponse is ApiErrorResponse) {
      throw apiResponse.errorMessage;
    }
    return null;
  }

  @override
  Future<List<SearchEnity>> getUsers(String userName) async {
    ApiProvider _apiProvider = ApiProvider(dio: dio);
    GenericApiResponse apiResponse = await _apiProvider.create(
      url: SEARCH_USER + userName,
    );
    if (apiResponse is ApiSuccesResponse) {
      List<SearchEnity> users = List();
      apiResponse.responseBody['items'].forEach((element) {
        users.add(UserSearchModel.fromJson(element));
      });
      return users;
    } else if (apiResponse is ApiErrorResponse) {
      throw apiResponse.errorMessage;
    }
    return null;
  }
}
