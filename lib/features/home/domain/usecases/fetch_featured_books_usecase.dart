import 'package:bookly_app/core/use_cases/use_case.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implement.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/book_entity.dart';

class FetchFeatureBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepoImplement homeRepo;

  FetchFeatureBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([int pageNo = 0]) {
    return homeRepo.fetchFeaturedBooks(pageNo: pageNo);
  }
}
