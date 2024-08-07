import 'package:bookly_app_clean/Features/home/presentation/views/widgets/newset_book_list_view_loading_item.dart';
import 'package:bookly_app_clean/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class NewsetBooksListViewLoadingIndicator extends StatelessWidget {
  const NewsetBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: NewsetBookListViewLoadingItem());
        },
      ),
    );
  }
}
