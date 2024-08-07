import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBookData(List<BookEntity> books, String boxName) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
