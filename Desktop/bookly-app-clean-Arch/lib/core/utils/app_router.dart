import 'package:bookly_app_clean/Features/Splash/presentation/views/splash_view.dart';
import 'package:bookly_app_clean/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app_clean/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app_clean/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean/Features/home/domain/use_cases/fetch_simiar_books_use_case.dart';
import 'package:bookly_app_clean/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app_clean/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app_clean/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app_clean/Features/search/data/repos/search_repo_impl.dart';
import 'package:bookly_app_clean/Features/search/domian/use_cases/fetch_search_books_use_case.dart';
import 'package:bookly_app_clean/Features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app_clean/Features/search/presentation/views/search_view.dart';
import 'package:bookly_app_clean/core/utils/api_service.dart';
import 'package:bookly_app_clean/core/utils/function/setup_service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
            create: (context) => SearchBooksCubit(
                  FetchSearchBooksUseCase(
                    searchRepo: getIt.get<SearchRepoImpl>(),
                  ),
                ),
            child: const SearchView()),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
            create: (context) => SimilarBooksCubit(FetchSimilarBooksUseCase(
                HomeRepoImpl(
                    homeRemoteDataSource:
                        HomeRemoteDataSourceImpl(getIt.get<ApiService>())))),
            child: BookDetailsView(
              book: state.extra as BookEntity,
            )),
      ),
    ],
  );
}
