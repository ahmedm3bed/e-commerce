import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app_clean/Features/home/presentation/views/widgets/featured_books_list_view_loading_indicator.dart';
import 'package:bookly_app_clean/core/utils/function/build_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'similar_books_list_view.dart';

class SimilarBooksListViewBlocConsumer extends StatefulWidget {
  const SimilarBooksListViewBlocConsumer({
    super.key,
    this.categoryBook,
  });
  final String? categoryBook;

  @override
  State<SimilarBooksListViewBlocConsumer> createState() =>
      _SimilarBooksListViewBlocConsumerState();
}

class _SimilarBooksListViewBlocConsumerState
    extends State<SimilarBooksListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBooksCubit, SimilarBooksStates>(
        listener: (context, state) {
      if (state is SimilarBooksSuccess) {
        books.addAll(state.books);
      }
      if (state is SimilarBooksPaginationFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(buildErrorWidget(state.errorMessage));
      }
    }, builder: (context, state) {
      if (state is SimilarBooksSuccess ||
          state is SimilarBooksPaginationLoading ||
          state is SimilarBooksPaginationFailure) {
        return SimilarBooksListview(
          books: books,
          categoryBook: widget.categoryBook,
        );
      } else if (state is SimilarBooksFailure) {
        return Center(
          child: Text(
            state.errorMessage,
            textAlign: TextAlign.center,
          ),
        );
      } else {
        return HorizontalBooksListViewLoadingIndicator(
          height: MediaQuery.of(context).size.height * .17,
        );
      }
    });
  }
}
