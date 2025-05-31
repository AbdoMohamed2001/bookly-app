import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: Color(0xffFFDD4F),
        ),
        SizedBox(
          width: 6.3,
        ),
        Text(
          '4.8',
          style: TextStyles.textStyle16Medium,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          '(2390)',
          style: TextStyles.textStyle14Medium
              .copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
