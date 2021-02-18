import 'package:Test01/core/api/check_connectivity.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import './generic_api_response.dart';

class ApiProvider {
  final Dio dio;

  ApiProvider({this.dio});

  Future<GenericApiResponse> create({
    String url,
  }) async {
    GenericApiResponse responses;
    if (await CheckConnection().checkIsInternet()) {
      // pretty logger
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));

      // retry interceptor

      try {
        Response response = await dio.get(url);
        responses = await GenericApiResponse().create(response);
      } catch (e) {
        responses = await GenericApiResponse().error(e);
      }
    } else {
      throw 'No Internet';
    }

    return responses;
  }
}
