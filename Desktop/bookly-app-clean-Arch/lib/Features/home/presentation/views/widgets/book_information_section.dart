import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app_clean/constants.dart';
import 'package:bookly_app_clean/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookInformationSection extends StatelessWidget {
  const BookInformationSection({
    super.key,
    required this.book,
  });
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .5,
          child: Text(
            book.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle20.copyWith(
              fontFamily: kGtSectraFine,
            ),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          book.authorName ?? 'No Author',
          style: Styles.textStyle14,
          maxLines: 1,
        ),
        const SizedBox(
          height: 3,
        ),
        Row(
          children: [
            Text(
              'Free',
              style: Styles.textStyle20.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            BookRating(
              avgRating: book.rating ?? 0,
              count: book.count ?? 0,
            ),
          ],
        ),
      ],
    );
  }
}
