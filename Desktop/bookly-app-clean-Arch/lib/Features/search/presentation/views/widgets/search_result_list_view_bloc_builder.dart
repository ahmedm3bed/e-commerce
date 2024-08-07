import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/Features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:bookly_app_clean/core/utils/function/build_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/search_books_cubit/search_books_cubit.dart';

class SearchResultListViewBlocCustomer extends StatefulWidget {
  const SearchResultListViewBlocCustomer({
    super.key,
    this.searchBook,
  });
  final String? searchBook;

  @override
  State<SearchResultListViewBlocCustomer> createState() =>
      _SearchResultListViewBlocCustomerState();
}

class _SearchResultListViewBlocCustomerState
    extends State<SearchResultListViewBlocCustomer> {
  @override
  Widget build(BuildContext context) {
    List<BookEntity> books = [];
    return BlocConsumer<SearchBooksCubit, SearchBooksStates>(
        listener: (context, state) {
      if (state is SearchBooksSuccess) {
        books.addAll(state.books);
      }
      if (state is SearchBooksPaginationFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(buildErrorWidget(state.errorMessage));
      }
    }, builder: (context, state) {
      if (state is SearchBooksSuccess ||
          state is SearchBooksPaginationLoading ||
          state is SearchBooksPaginationFailure) {
        return SearchResultListView(
          books: books,
          searchBook: widget.searchBook,
        );
      } else if (state is SearchBooksFailure) {
        return Text(
          state.errorMessage,
          textAlign: TextAlign.center,
        );
      } else {
        return Container();
      }
    });
  }
}
