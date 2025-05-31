import 'package:flutter/material.dart';

class RecommendedItem extends StatelessWidget {
  const RecommendedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          'https://m.media-amazon.com/images/I/81q77Q39nEL._AC_UF1000,1000_QL80_.jpg',
        ),
      ),
    );
  }
}
