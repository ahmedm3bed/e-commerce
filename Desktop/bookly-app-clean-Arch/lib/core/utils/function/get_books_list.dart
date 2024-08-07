import 'package:bookly_app_clean/Features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';

List<BookEntity> getBooksList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  for (var bookItem in data['items']) {
    books.add(BookModel.fromJson(bookItem));
  }
  return books;
}
