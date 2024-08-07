import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/core/utils/api_service.dart';
import 'package:bookly_app_clean/core/utils/function/get_books_list.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> fetchSearchRemoteDataSource(
      {required String searchbooks, int pageNumber = 0});
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchSearchRemoteDataSource(
      {required String searchbooks, int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=$searchbooks&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    return books;
  }
}
