part of 'search_books_cubit.dart';

@immutable
abstract class SearchBooksStates {}

class SearchBooksInitial extends SearchBooksStates {}

class SearchBooksLoading extends SearchBooksStates {}

class SearchBooksPaginationLoading extends SearchBooksStates {}

class SearchBooksFailure extends SearchBooksStates {
  final String errorMessage;

  SearchBooksFailure(this.errorMessage);
}

class SearchBooksPaginationFailure extends SearchBooksStates {
  final String errorMessage;

  SearchBooksPaginationFailure(this.errorMessage);
}

class SearchBooksSuccess extends SearchBooksStates {
  final List<BookEntity> books;

  SearchBooksSuccess(this.books);
}
