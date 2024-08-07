import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/Features/home/domain/use_cases/fetch_feature_boos_use_case.dart';
import 'package:flutter/material.dart';
part 'featured_books_states.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates> {
  FeaturedBooksCubit(this.fetchFeatureBooksUseCase)
      : super(FeaturedBooksInitial());
  final FetchFeatureBooksUseCase fetchFeatureBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await fetchFeatureBooksUseCase.call(pageNumber);

    result.fold((failure) {
      if (pageNumber == 0) {
        emit(FeaturedBooksFailure(failure.errorMessage));
      } else {
        emit(FeaturedBooksPaginationFailure(failure.errorMessage));
      }
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
