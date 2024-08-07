import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app_clean/core/error/failure.dart';
import 'package:bookly_app_clean/core/use_cases/use_case_two_param.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUseCase
    extends UseCaseTwoParam<List<BookEntity>, String, int> {
  final HomeRepo homeRepo;

  FetchSimilarBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call(
      [String? item, int element = 0]) async {
    return await homeRepo.fetchSimiarBooks(
        catogry: item ?? 'programming', pageNumber: element);
  }
}
