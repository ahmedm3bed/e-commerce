import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/Features/home/domain/use_cases/fetch_newset_books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'newset_books_states.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksStates> {
  NewsetBooksCubit(this.fetchNewsetBooksUseCase) : super(NewsetBooksInitial());

  final FetchNewsetBooksUseCase fetchNewsetBooksUseCase;

  Future<void> fetchNewsetBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewsetBooksLoading());
    } else {
      emit(NewsetBooksPaginationLoading());
    }
    var result = await fetchNewsetBooksUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(NewsetBooksfailure(failure.errorMessage));
      } else {
        emit(NewsetBooksPaginationfailure(failure.errorMessage));
      }
    }, (books) {
      emit(NewsetBooksSuccess(books));
    });
  }
}
