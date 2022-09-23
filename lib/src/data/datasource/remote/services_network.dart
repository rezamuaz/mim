import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mim/src/core/Dio/dio_client.dart';
import 'package:mim/src/core/Dio/endpoint.dart';

class ServicesNetwork {
  final DioClient dio;

  ServicesNetwork(this.dio);
  Future<Response> getPost() async {
    try {
      final response = await dio.request(Endpoints.listPost);
      return response;
    } catch (e) {
      Logger(printer: SimplePrinter(colors: true)).e(e);
      rethrow;
    }
  }
}
