import 'package:bookly_app/core/utils/styles/text_styles.dart';
import 'package:bookly_app/features/details/presentation/views/widgets/recommended_list_view.dart';
import 'package:bookly_app/features/details/presentation/views/widgets/book_details.dart';
import 'package:bookly_app/features/details/presentation/views/widgets/details_action_buttons.dart';
import 'package:bookly_app/features/details/presentation/views/widgets/details_app_bar.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsAppBar(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              BookDetails(),
              DetailsActionButtons(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              Text(
                'You can also like',
                style: TextStyles.textStyle14Medium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              RecommendedListView(),
            ],
          ),
        ),
      ),
    );
  }
}
