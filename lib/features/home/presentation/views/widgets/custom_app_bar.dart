import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Assets.imagesLogo,
          fit: BoxFit.cover,
          width: 100,
        ),
        Spacer(),
        GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.search,
            color: Colors.white,
            size: 28,
          ),
        ),
      ],
    );
  }
}
