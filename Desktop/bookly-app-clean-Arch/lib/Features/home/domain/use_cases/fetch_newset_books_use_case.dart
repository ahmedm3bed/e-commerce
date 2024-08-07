import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app_clean/core/error/failure.dart';
import 'package:bookly_app_clean/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchNewsetBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchNewsetBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call([int item = 0]) async {
    return await homeRepo.fetchNewsetBooks(pageNumber: item);
  }
}
