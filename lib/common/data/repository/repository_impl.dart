import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_weather/common/data/model/models.dart';
import 'package:task_weather/common/domain/entities/entities.dart';

import '../../../core/core.dart';
import '../../domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  final _dio = DioClient.instance;

  @override
  Future<Either<Exception, ApiData?>> fetchData(String? query) async {
    try {
      final response = await _dio.get("$baseUrl$current?key=$apiKey&q=${query ?? toshkent}");
      if (response.statusCode == 200) {
        if (response.data == null) {
          return Left(JsonParsingException());
        }
        final apiResponse = ApiResponse.fromJson(response.data);
        final data = apiResponse.toDomain();
        return Right(data);
      } else {
        return Left(JsonParsingException());
      }
    } on DioException catch (e) {
      return Left(Exception(e));
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
