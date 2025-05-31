import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_listview_builder.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/styles/text_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            right: 30.0,
            top: 30,
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(),
                    SizedBox(height: 47),
                    FeaturedBooksListViewBuilder(),
                    SizedBox(height: 51),
                    Text(
                      'Best Seller',
                      style: TextStyles.textStyle18SemiBold,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SliverFillRemaining(
                child: BestSellerListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
