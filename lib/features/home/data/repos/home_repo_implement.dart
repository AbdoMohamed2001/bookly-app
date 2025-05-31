import 'dart:developer';

import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/data_sources/local_data_source/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplement extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImplement({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNo = 0}) async {
    try {
      List<BookEntity> booksLocalData =
          homeLocalDataSource.fetchFeaturedBooks();
      if (booksLocalData.isNotEmpty) {
        log('there is local data');
        // return right(booksLocalData);
      }
      //---------------------------------------------------
      List<BookEntity> booksRemoteData =
          await homeRemoteDataSource.fetchFeaturedBooks();
      return right(booksRemoteData);
    } catch (e) {
      if (e is DioException) {
        log('there is error in dio in home repo impl ${e.toString()}');
        return left(ServerFailure.fromDioError(e));
      }
      log('there is error in home repo impl ${e.toString()}');
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchLatestBooks(
      {int pageNo = 0}) async {
    try {
      List<BookEntity> booksLocalData = homeLocalDataSource.fetchLatestBooks();
      if (booksLocalData.isNotEmpty) {
        return right(booksLocalData);
      }
      List<BookEntity> booksRemoteData =
          await homeRemoteDataSource.fetchLatestBooks();
      return right(booksRemoteData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure('there is an error please try again later'));
    }
  }
}
