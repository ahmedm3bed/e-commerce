import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/Features/home/presentation/manager/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly_app_clean/Features/home/presentation/views/widgets/newset_books_view_loading_indicator.dart';
import 'package:bookly_app_clean/Features/home/presentation/views/widgets/newset_list_view.dart';
import 'package:bookly_app_clean/core/utils/function/build_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsetListViewBlocConsumer extends StatefulWidget {
  const NewsetListViewBlocConsumer({
    super.key,
  });

  @override
  State<NewsetListViewBlocConsumer> createState() =>
      _NewsetListViewBlocConsumerState();
}

class _NewsetListViewBlocConsumerState
    extends State<NewsetListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsetBooksCubit, NewsetBooksStates>(
        listener: (context, state) {
      if (state is NewsetBooksSuccess) {
        books.addAll(state.books);
      }
      if (state is NewsetBooksPaginationfailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(buildErrorWidget(state.errorMessage));
      }
    }, builder: (context, state) {
      if (state is NewsetBooksSuccess ||
          state is NewsetBooksPaginationLoading ||
          state is NewsetBooksPaginationfailure) {
        return NewsetListView(
          books: books,
        );
      } else if (state is NewsetBooksfailure) {
        return Center(child: Text(state.errorMessage));
      } else {
        return const NewsetBooksListViewLoadingIndicator();
      }
    });
  }
}
