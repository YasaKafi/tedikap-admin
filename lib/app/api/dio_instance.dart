import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tedikap_admin/app/api/api_endpoint.dart';

class DioInstance {
    late Dio _dio;

  
   DioInstance()  {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoint.baseUrl,
      )
    );


    initializeInterceptors();
  }


  
  //All Method of Requests
  Future<Response> getRequest({required String endpoint, bool? isAuthorize, Map<String, dynamic>? queryParameters}) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      response = await _dio.get(endpoint, queryParameters: queryParameters,
        options: Options(
            headers: {
              "Accept": "application/json",
              if(isAuthorize ?? false) "Authorization": "Bearer $token"
            }),
      );
    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;

  }

  Future<Response> postRequest({required String endpoint, bool? isAuthorize, required Object data, Options? options}) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    try {
      response = await _dio.post(
          endpoint,
          data: data,
          options: Options(
              headers: {
                "Accept": "application/json",
                if(isAuthorize ?? false) "Authorization": "Bearer $token"
              }..addAll(options?.headers ?? {}),
            contentType: options?.contentType,

              )

      );


    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  Future<Response> postImageRequest({required String endpoint, bool? isAuthorize, required Object data}) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    try {
      response = await _dio.post(
          endpoint,
          data: data,
          options: Options(
              headers: {
                "Accept": "application/json",
                "Content-Type": "multipart/form-data",
                if(isAuthorize ?? false) "Authorization": "Bearer $token"
              })
      );


    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  Future<Response> putRequest({required String endpoint,  bool? isAuthorize, required Object data}) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      response = await _dio.put(
          endpoint,
          data: data,
          options: Options(
              headers: {
                "Accept": "application/json",
                if(isAuthorize ?? false) "Authorization": "Bearer $token"
              })
      );

    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  Future<Response> deleteRequest({required String endpoint, bool? isAuthorize}) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      response = await _dio.delete(
          endpoint,
          options: Options(
              headers: {
                "Accept": "application/json",
                if(isAuthorize ?? false) "Authorization": "Bearer $token"
              })
      );

    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }
  
  void initializeInterceptors() {
    _dio.interceptors.add(
        InterceptorsWrapper(
          onError: (error, handler) {
            return handler.next(error);
          },

          onRequest: (request, handler) {
            print(request.method + " " + request.path);
            print(request.data);
            return handler.next(request);
          },

          onResponse: (response, handler) {
            print(response.data);
            return handler.next(response);
          }
        )
    );

  }
}