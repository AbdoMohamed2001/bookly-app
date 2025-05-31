part of 'feature_books_cubit.dart';

@immutable
sealed class FeatureBooksState {}

final class FeatureBooksInitial extends FeatureBooksState {}

final class FeatureBooksSuccess extends FeatureBooksState {
  final List<BookEntity> books;

  FeatureBooksSuccess({required this.books});
}

final class FeatureBooksLoading extends FeatureBooksState {}

final class FeatureBooksFailure extends FeatureBooksState {
  final String failMessage;

  FeatureBooksFailure({required this.failMessage});
}
