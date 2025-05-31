import 'package:flutter/material.dart';

import '../../../../../core/utils/components/item_card.dart';
import '../../../../../core/utils/styles/text_styles.dart';
import '../../../../../core/utils/components/rating_bar.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ItemCard(
          imageUrl: '',
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        Text(
          'The Jungle Book',
          style: TextStyles.textStyle30,
        ),
        Text(
          'Rudyard Kipling',
          style: TextStyles.textStyle18SemiBold.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 16),
        RatingBar(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.042),
      ],
    );
  }
}
