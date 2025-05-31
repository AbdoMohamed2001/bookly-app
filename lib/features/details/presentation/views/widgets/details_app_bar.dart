import 'package:flutter/material.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.close,
            size: 28,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
            size: 28,
          ),
        ),
      ],
    );
  }
}
