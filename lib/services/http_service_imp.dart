import 'package:dio/dio.dart';
import 'package:simple_api/services/http_service.dart';

const BASE_URL = "https://newsapi.org/";
const API_KEY = "9426d5cea9b8457391de2be05fcad2be";

class HttpServiceImp implements HttpService {
  late Dio _dio;

  @override
  Future<Response> getRequest(String url) async {
    Response response;
    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      print(e);
      throw Exception(e.message);
    }
    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) {
        print(error.message);
      },
      onRequest: (request, handler) {
        print("${request.method} | ${request.path}");
        return handler.next(request);
      },
      onResponse: (response, handler) {
        print(
            "${response.statusCode} | ${response.statusMessage} | ${response.data}");
        return handler.next(response);
      },
    ));
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(
        baseUrl: BASE_URL, headers: {"Authorization": "Bearer $API_KEY"}));
    initializeInterceptors();
  }
}
