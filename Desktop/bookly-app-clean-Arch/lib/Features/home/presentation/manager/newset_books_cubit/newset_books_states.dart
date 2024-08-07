part of 'newset_books_cubit.dart';

@immutable
abstract class NewsetBooksStates {}

class NewsetBooksInitial extends NewsetBooksStates {}

class NewsetBooksLoading extends NewsetBooksStates {}

class NewsetBooksPaginationLoading extends NewsetBooksStates {}

class NewsetBooksfailure extends NewsetBooksStates {
  final String errorMessage;

  NewsetBooksfailure(this.errorMessage);
}

class NewsetBooksPaginationfailure extends NewsetBooksStates {
  final String errorMessage;

  NewsetBooksPaginationfailure(this.errorMessage);
}

class NewsetBooksSuccess extends NewsetBooksStates {
  final List<BookEntity> books;

  NewsetBooksSuccess(this.books);
}
