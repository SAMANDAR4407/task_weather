import 'package:dartz/dartz.dart';
import 'package:task_weather/common/domain/entities/entities.dart';

abstract class Repository {
  Future<Either<Exception, ApiData?>> fetchData(String? query);
}