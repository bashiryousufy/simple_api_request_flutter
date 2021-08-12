import 'package:dio/dio.dart';
import 'package:simple_api/services/http_service.dart';
import '../config/APIConfig.dart';

class HttpServiceImp implements HttpService {
  final BASE_URL = "https://newsapi.org/";
  final API_KEY = APIConfig.API_KEY;
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
      },
      onResponse: (response, handler) {
        print(
            "${response.statusCode} | ${response.statusMessage} | ${response.data}");
      },
    ));
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      headers: {"Authorization": "Bearer $API_KEY"},
    ));

    initializeInterceptors();
  }
}
