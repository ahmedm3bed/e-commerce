import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app_clean/core/error/failure.dart';
import 'package:bookly_app_clean/core/use_cases/use_case_two_param.dart';
import 'package:dartz/dartz.dart';

class FetchSearchBooksUseCase
    extends UseCaseTwoParam<List<BookEntity>, String, int> {
  final SearchRepo searchRepo;

  FetchSearchBooksUseCase({required this.searchRepo});
  @override
  Future<Either<Failure, List<BookEntity>>> call(String item,
      [int element = 0]) async {
    return await searchRepo.fetchSearchBooks(
      searchBooks: item,
      pageNumber: element,
    );
  }
}
