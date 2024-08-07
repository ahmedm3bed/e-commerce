import 'package:bookly_app_clean/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCaseTwoParam<Type, Parma, Element> {
  Future<Either<Failure, Type>> call(Parma item, [Element element]);
}
