import 'package:bookly_app_clean/Features/home/presentation/views/widgets/custom_book_image_loading_indicator.dart';
import 'package:bookly_app_clean/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class HorizontalBooksListViewLoadingIndicator extends StatelessWidget {
  const HorizontalBooksListViewLoadingIndicator(
      {super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: CustomBookImageLoadingIndicator(),
            );
          },
          itemCount: 15,
        ),
      ),
    );
  }
}
