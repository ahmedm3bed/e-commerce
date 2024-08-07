import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'best_seller_list_view_item.dart';

class NewsetListView extends StatefulWidget {
  const NewsetListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<NewsetListView> createState() => _NewsetListViewState();
}

class _NewsetListViewState extends State<NewsetListView> {
  // late final ScrollController _scrollController;
  // var nextpage = 1;
  @override
  void initState() {
    super.initState();
    // _scrollController = ScrollController();
    // _scrollController.addListener(_scrollListener);
  }

  // void _scrollListener() async {
  //   var currentPositions = _scrollController.position.pixels;
  //   var maxScrollLength = _scrollController.position.maxScrollExtent;
  //   if (currentPositions >= 0.7 * maxScrollLength) {
  //     BlocProvider.of<NewsetBooksCubit>(context)
  //         .fetchNewsetBooks(pageNumber: nextpage++);
  //   }
  // }
  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      //controller: _scrollController,
      itemCount: widget.books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(
            book: widget.books[index],
          ),
        );
      },
    );
  }
}
