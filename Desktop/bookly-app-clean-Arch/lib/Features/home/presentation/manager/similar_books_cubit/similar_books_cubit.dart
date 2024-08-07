import 'package:bookly_app_clean/Features/home/domain/use_cases/fetch_simiar_books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/book_entity.dart';
part 'similar_books_states.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksStates> {
  SimilarBooksCubit(this.fetchSimilarBooksUseCase)
      : super(SimilarBooksInitial());
  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;

  Future<void> fetchSimilarBooks(
      {required String categoty, int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(SimilarBooksLoading());
    } else {
      emit(SimilarBooksPaginationLoading());
    }
    var result = await fetchSimilarBooksUseCase.call(categoty, pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(SimilarBooksFailure(failure.errorMessage));
      } else {
        emit(SimilarBooksPaginationFailure(failure.errorMessage));
      }
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
