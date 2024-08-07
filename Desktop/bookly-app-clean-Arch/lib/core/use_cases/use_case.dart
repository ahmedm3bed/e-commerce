import 'package:bookly_app_clean/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Parma> {
  Future<Either<Failure, Type>> call([Parma item]);
}
