import 'package:bookly_app/core/utils/constants.dart';
import 'package:hive/hive.dart';

import '../../../domain/entities/book_entity.dart';
import 'home_local_data_source.dart';

class HomeLocalDataSourceImplementation extends HomeLocalDataSource {
  HomeLocalDataSourceImplementation();

  @override
  List<BookEntity> fetchFeaturedBooks({int pageNo = 0}) {
    var hiveBox = Hive.box<BookEntity>(kFeaturedBox);
    return hiveBox.values.toList();
  }

  @override
  List<BookEntity> fetchLatestBooks({int pageNo = 0}) {
    var hiveBox = Hive.box<BookEntity>(kLatestBox);
    return hiveBox.values.toList();
  }
}
