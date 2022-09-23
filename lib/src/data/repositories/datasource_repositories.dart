import 'package:dio/dio.dart';
import 'package:mim/src/core/exception/dio_exceptio.dart';
import 'package:mim/src/data/datasource/remote/services_network.dart';
import 'package:mim/src/data/model/post_model_response.dart';

class DataSourceRepositories {
  final ServicesNetwork service;

  DataSourceRepositories(this.service);

  Future<List<Memes>> getPost() async {
    try {
      final response = await service.getPost();
      if (response.data['success'] == true) {
        final list = (response.data['data']['memes'] as List)
            .map((e) => Memes.fromJson(e))
            .toList();
        return list;
      }
      return [];
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
