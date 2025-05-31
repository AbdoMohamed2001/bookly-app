import 'dart:developer';

import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/core/utils/methods/cache_books.dart';
import 'package:bookly_app/features/home/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

import '../../../../../core/utils/constants.dart';

class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource {
  final ApiServices apiServices;
  HomeRemoteDataSourceImplementation({required this.apiServices});

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNo = 0}) async {
    Map<String, dynamic> data = await apiServices.get(
        endPoint:
            'volumes?q=programming&filter=free-ebooks&startIndex=${pageNo * 10}');
    List<BookEntity> books = getBooksList(data);

    cacheBooksData(books: books, boxName: kFeaturedBox);

    return books;
  }

//---------------------------------------------------------
  @override
  Future<List<BookEntity>> fetchLatestBooks({int pageNo = 0}) async {
    Map<String, dynamic> data = await apiServices.get(
        endPoint:
            '/volumes?q=sports&filter=free-ebooks&&orderBy=newest&startIndex=${pageNo * 10}');
    List<BookEntity> books = getBooksList(data);
    cacheBooksData(books: books, boxName: kLatestBox);

    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    try {
      final items = data['items'];
      if (items == null || items.isEmpty) return [];
      for (var book in items) {
        try {
          books.add(BookModel.fromJson(book));
        } catch (e) {
          log('Error parsing book: ${book['id']} -- ${e.toString()}');
        }
      }
      return books;
    } catch (e) {
      log('error in getBooks List method ${e.toString()}');
      throw Exception(e.toString());
    }
  }
}
