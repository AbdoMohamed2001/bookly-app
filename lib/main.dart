import 'package:bookly_app/core/utils/methods/setup_get_it.dart';
import 'package:bookly_app/core/utils/simple_bloc_observer.dart';
import 'package:bookly_app/features/details/presentation/views/details_view.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implement.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/usecases/fetch_featured_books_usecase.dart';
import 'package:bookly_app/features/home/presentation/manager/cubits/featured_books/feature_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/cubits/latest_books/latest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/utils/constants.dart';
import 'features/home/domain/usecases/fetch_latest_books_usecase.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kLatestBox);
  setupLocator();
  Bloc.observer = SimpleBlocObserver();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FeatureBooksCubit>(
          create: (context) => FeatureBooksCubit(
            FetchFeatureBooksUseCase(
              homeRepo: locator.get<HomeRepoImplement>(),
            ),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider<LatestBooksCubit>(
          create: (context) => LatestBooksCubit(
            FetchLatestBooksUseCase(
              homeRepo: locator.get<HomeRepoImplement>(),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
        title: 'Bookly App',
        theme: ThemeData(),
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xff100B20),
        ),
        themeMode: ThemeMode.dark,
      ),
    );
  }
}

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashView();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
    ),
    GoRoute(
      path: '/details',
      builder: (BuildContext context, GoRouterState state) {
        return const DetailsView();
      },
    ),
  ],
);
