import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../generated/assets.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.go('/details');
        },
        child: Center(child: Image.asset(Assets.imagesLogo)));
  }
}
