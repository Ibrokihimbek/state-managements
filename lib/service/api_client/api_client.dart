import 'package:dio/dio.dart';
import 'package:nbu_api/service/custom_exeption/custom_exeption.dart';

class ApiClient {
  ApiClient() {
    _init();
  }

  late Dio dio;

  _init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://nbu.uz/en/exchange-rates/json/",
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, ErrorInterceptorHandler handler) {
          switch (error.type) {
            case DioExceptionType.connectionTimeout:
            case DioExceptionType.sendTimeout:
              throw DeadlineExceededException(error.requestOptions);
            case DioExceptionType.receiveTimeout:
              throw ReceiveTimeOutException(error.requestOptions);
            case DioExceptionType.badResponse:
              switch (error.response?.statusCode) {
                case 400:
                  throw BadRequestException(error.response?.data['message']);
                case 401:
                  throw UnauthorizedException(error.requestOptions);
                case 404:
                  throw NotFoundException(error.requestOptions);
                case 409:
                  throw ConflictException(error.requestOptions);
                case 500:
                case 501:
                case 503:
                  throw InternalServerErrorException(error.requestOptions);
              }
              break;
            case DioExceptionType.cancel:
              break;
            case DioExceptionType.connectionError:
              throw NoInternetConnectionException(error.requestOptions);
            case DioExceptionType.badCertificate:
              // TODO: Handle this case.
            case DioExceptionType.unknown:
              // TODO: Handle this case.
          }
          return handler.next(error);
        },
        onRequest:
            (RequestOptions requestOptions, RequestInterceptorHandler handler) {
          return handler.next(requestOptions);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
      ),
    );
  }
}