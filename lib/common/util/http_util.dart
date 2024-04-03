import 'package:dio/dio.dart';
import 'package:ulearning/global.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: "http://192.168.43.176:8080/",
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
        headers: {},
        contentType: "application/json",
        responseType: ResponseType.json);
    dio = Dio(options);
  }

  Future post(String path, {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post("create-user",
        data: data, queryParameters: queryParameters, options: requestOptions);
    print(response);
    return response.data;
  }

  Future get(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.get("get-courses",
        data: data, queryParameters: queryParameters, options: requestOptions);
    return response.data;
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = "Bearer ${accessToken}";
    }
    return headers;
  }
}
