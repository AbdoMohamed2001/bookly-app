part of 'latest_books_cubit.dart';

@immutable
sealed class LatestBooksState {}

final class LatestBooksInitial extends LatestBooksState {}

final class LatestBooksLoading extends LatestBooksState {}

final class LatestBooksSuccess extends LatestBooksState {
  final List<BookEntity> books;

  LatestBooksSuccess({required this.books});
}

final class LatestBooksFailure extends LatestBooksState {
  final String failMessage;

  LatestBooksFailure({required this.failMessage});
}
