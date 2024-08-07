import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/Features/search/data/data_source/search_remote_data_source.dart';
import 'package:bookly_app_clean/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app_clean/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl({required this.searchRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchSearchBooks(
      {required String searchBooks, int pageNumber = 0}) async {
    try {
      var books = await searchRemoteDataSource.fetchSearchRemoteDataSource(
          searchbooks: searchBooks, pageNumber: pageNumber);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExceptions(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
