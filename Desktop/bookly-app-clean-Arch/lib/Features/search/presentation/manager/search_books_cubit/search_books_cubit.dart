import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/Features/search/domian/use_cases/fetch_search_books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'search_book_states.dart';

class SearchBooksCubit extends Cubit<SearchBooksStates> {
  SearchBooksCubit(this.fetchSearchBooksUseCase) : super(SearchBooksInitial());
  final FetchSearchBooksUseCase fetchSearchBooksUseCase;

  Future<void> fetchSearchBooks(
      {required String searchBook, int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(SearchBooksLoading());
    } else {
      emit(SearchBooksPaginationLoading());
    }
    var result = await fetchSearchBooksUseCase.call(searchBook, pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(SearchBooksFailure(failure.errorMessage));
      } else {
        emit(SearchBooksPaginationFailure(failure.errorMessage));
      }
    }, (books) {
      emit(SearchBooksSuccess(books));
    });
  }
}
