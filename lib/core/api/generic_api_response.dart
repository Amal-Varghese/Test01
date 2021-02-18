import 'package:dio/dio.dart';

class GenericApiResponse<T> {
  Future<GenericApiResponse<T>> error(DioError error) async {
    return  ApiErrorResponse('unidentified error occured $error');
  }

  Future<GenericApiResponse<T>> create(Response response) async {
    if (response != null) {
      if (response.statusCode == 200) {
        return ApiSuccesResponse(response.data);
      } else {
        return ApiErrorResponse('Something went wrong');
      }
    } else {
      return ApiErrorResponse('Something went wrong');
    }
  }
}

class ApiSuccesResponse<T> extends GenericApiResponse<T> {
  final T _body;

  ApiSuccesResponse(this._body);

  T get responseBody => this._body;
}

class ApiErrorResponse<T> extends GenericApiResponse<T> {
  final String _errMsg;

  ApiErrorResponse(this._errMsg);

  String get errorMessage => this.errorMessage;
}
