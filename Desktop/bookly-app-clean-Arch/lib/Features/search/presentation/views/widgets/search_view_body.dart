import 'package:bookly_app_clean/Features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_search_text_field.dart';
import 'search_result_list_view_bloc_builder.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  String? searchBook;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            onSumitted: (value) {
              searchBooksMethod(value, context);
              setState(() {
                searchBook = value;
              });
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Search Result',
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: SearchResultListViewBlocCustomer(searchBook: searchBook),
          ),
        ],
      ),
    );
  }

  void searchBooksMethod(String value, BuildContext context) {
    String searchBook = value;
    BlocProvider.of<SearchBooksCubit>(context)
        .fetchSearchBooks(searchBook: searchBook);
  }
}
