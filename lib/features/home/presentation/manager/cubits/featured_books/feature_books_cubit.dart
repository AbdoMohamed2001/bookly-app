import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/usecases/fetch_featured_books_usecase.dart';
import 'package:meta/meta.dart';

part 'feature_books_state.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.fetchFeatureBooksUseCase)
      : super(FeatureBooksInitial());

  final FetchFeatureBooksUseCase fetchFeatureBooksUseCase;

  fetchFeaturedBooks({int pageNo = 0}) async {
    emit(FeatureBooksLoading());
    var result = await fetchFeatureBooksUseCase.call(pageNo);
    result.fold(
      (failure) {
        emit(FeatureBooksFailure(failMessage: failure.failMessage));
      },
      (books) {
        emit(FeatureBooksSuccess(books: books));
      },
    );
  }
}
