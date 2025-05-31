import 'package:bookly_app/features/home/presentation/manager/cubits/featured_books/feature_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'item_card_list_view.dart';

class FeaturedBooksListViewBuilder extends StatelessWidget {
  const FeaturedBooksListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBooksCubit, FeatureBooksState>(
      builder: (context, state) {
        if (state is FeatureBooksSuccess) {
          return ItemCardListView(
            books: state.books,
          );
        } else if (state is FeatureBooksFailure) {
          return Text(state.failMessage);
        }
        return Center(
          child: CircularProgressIndicator(
            color: Colors.orange,
          ),
        );
      },
    );
  }
}
