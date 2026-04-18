import 'package:dio/dio.dart';
import '../res/constants.dart';
import '../utils/utils.dart';

class DioClient {
  static Dio get instance => _singleton._dio;
  static final DioClient _singleton = DioClient._internal();
  final Dio _dio;

  DioClient._internal() : _dio = _createDio();

  factory DioClient() {
    return _singleton;
  }

  static Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveTimeout: const Duration(seconds: 20),
        connectTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
      ),
    );
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (object) {
          networkLogging(object);
        },
      ),
    );

    return dio;
  }
}
