part of 'similar_books_cubit.dart';

@immutable
abstract class SimilarBooksStates {}

class SimilarBooksInitial extends SimilarBooksStates {}

class SimilarBooksLoading extends SimilarBooksStates {}

class SimilarBooksPaginationLoading extends SimilarBooksStates {}

class SimilarBooksFailure extends SimilarBooksStates {
  final String errorMessage;

  SimilarBooksFailure(this.errorMessage);
}

class SimilarBooksPaginationFailure extends SimilarBooksStates {
  final String errorMessage;

  SimilarBooksPaginationFailure(this.errorMessage);
}

class SimilarBooksSuccess extends SimilarBooksStates {
  final List<BookEntity> books;

  SimilarBooksSuccess(this.books);
}
