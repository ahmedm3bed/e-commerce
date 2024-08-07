import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app_clean/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'book_information_section.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: book);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(linkImage: book.image ?? ''),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: BookInformationSection(book: book),
            ),
          ],
        ),
      ),
    );
  }
}
