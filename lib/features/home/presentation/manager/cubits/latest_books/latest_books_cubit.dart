import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/usecases/fetch_latest_books_usecase.dart';
import 'package:meta/meta.dart';

part 'latest_books_state.dart';

class LatestBooksCubit extends Cubit<LatestBooksState> {
  LatestBooksCubit(this.fetchLatestBooksUseCase) : super(LatestBooksInitial());
  final FetchLatestBooksUseCase fetchLatestBooksUseCase;

  fetchLatestBooks({int pageNo = 0}) async {
    emit(LatestBooksLoading());
    var result = await fetchLatestBooksUseCase.call(pageNo);
    result.fold(
      (failure) {
        emit(LatestBooksFailure(failMessage: failure.failMessage));
      },
      (books) {
        emit(LatestBooksSuccess(books: books));
      },
    );
  }
}
