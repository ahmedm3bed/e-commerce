import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'similar_books_list_view_bloc_consumer.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key, this.categroyBook});
  final String? categroyBook;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SimilarBooksListViewBlocConsumer(
          categoryBook: categroyBook,
        ),
      ],
    );
  }
}
