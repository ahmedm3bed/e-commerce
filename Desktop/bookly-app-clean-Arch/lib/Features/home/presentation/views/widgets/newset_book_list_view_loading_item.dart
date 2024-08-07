import 'package:bookly_app_clean/Features/home/presentation/views/widgets/custom_book_image_loading_indicator.dart';
import 'package:bookly_app_clean/constants.dart';
import 'package:flutter/material.dart';

class NewsetBookListViewLoadingItem extends StatelessWidget {
  const NewsetBookListViewLoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          height: 125,
          child: CustomBookImageLoadingIndicator(),
        ),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 17,
                color: kLoadingColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 17,
                color: kLoadingColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 17,
                color: kLoadingColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 20,
                    color: kLoadingColor,
                  ),
                  Container(
                    width: 60,
                    height: 20,
                    color: kLoadingColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
