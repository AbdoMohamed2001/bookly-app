import 'package:bookly_app/features/details/presentation/views/widgets/recommended_item.dart';
import 'package:flutter/material.dart';

class RecommendedListView extends StatelessWidget {
  const RecommendedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (_, i) => RecommendedItem(),
        separatorBuilder: (_, i) => SizedBox(
          width: 10,
        ),
      ),
    );
  }
}
