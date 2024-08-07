import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/constants.dart';
import 'package:bookly_app_clean/core/utils/api_service.dart';
import 'package:bookly_app_clean/core/utils/function/get_books_list.dart';
import 'package:bookly_app_clean/core/utils/function/save_book_data.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewsetBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchSimilarBooks(
      {required String category, int pageNumber = 0});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);

    saveBookData(books, kFeatureBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewsetBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=football&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);

    saveBookData(books, kNewsetBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks(
      {required String category, int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=relevance&q=$category&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    return books;
  }
}
