import '../../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNo = 0});
  List<BookEntity> fetchLatestBooks({int pageNo = 0});
}
