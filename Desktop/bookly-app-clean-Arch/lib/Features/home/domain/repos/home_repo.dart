import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchNewsetBooks(
      {int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchSimiarBooks(
      {required String catogry, int pageNumber = 0});
}
