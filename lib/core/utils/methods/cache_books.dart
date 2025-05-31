import 'package:hive/hive.dart';

import '../../../features/home/domain/entities/book_entity.dart';

void cacheBooksData(
    {required List<BookEntity> books, required String boxName}) {
  var hiveBox = Hive.box<BookEntity>(boxName);
  hiveBox.addAll(books);
}
