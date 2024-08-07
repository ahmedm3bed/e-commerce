import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/Features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:bookly_app_clean/Features/home/presentation/views/widgets/featured_books_list_view_loading_indicator.dart';
import 'package:bookly_app_clean/core/utils/function/build_error_widget.dart';
import 'package:bookly_app_clean/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocConsumer extends StatefulWidget {
  const FeaturedBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocConsumer> createState() =>
      _FeaturedBooksListViewBlocConsumerState();
}

class _FeaturedBooksListViewBlocConsumerState
    extends State<FeaturedBooksListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksStates>(
        listener: (context, state) {
      if (state is FeaturedBooksSuccess) {
        books.addAll(state.books);
      }
      if (state is FeaturedBooksPaginationFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(buildErrorWidget(state.errorMessage));
      }
    }, builder: (context, state) {
      if (state is FeaturedBooksSuccess ||
          state is FeaturedBooksPaginationLoading ||
          state is FeaturedBooksPaginationFailure) {
        return FeaturedBooksListView(
          books: books,
        );
      } else if (state is FeaturedBooksFailure) {
        return Center(child: Text(state.errorMessage));
      } else {
        return HorizontalBooksListViewLoadingIndicator(
          height: MediaQuery.of(context).size.height * .3,
        );
      }
    });
  }
}
