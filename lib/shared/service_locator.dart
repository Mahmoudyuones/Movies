import 'package:movies/features/browse/data/data_source/cateogories/categories_api_date_source.dart';
import 'package:movies/features/browse/data/data_source/cateogories/categories_data_source.dart';
import 'package:movies/features/home/data/data_source/popular_movies/popular_api_data_source.dart';
import 'package:movies/features/home/data/data_source/popular_movies/popular_data_source.dart';
import 'package:movies/features/home/data/data_source/top_rated_movies/top_rated_api_data_source.dart';
import 'package:movies/features/home/data/data_source/top_rated_movies/top_rated_data_source.dart';
import 'package:movies/features/home/data/data_source/upcoming_movies/upcomimg_data_source.dart';
import 'package:movies/features/home/data/data_source/upcoming_movies/upcoming_api_data_source.dart';
import 'package:movies/features/movie_details/data/data_source/movie_details_API_data_source.dart';
import 'package:movies/features/movie_details/data/data_source/movie_details_data_source.dart';
import 'package:movies/features/search/data/data_source/search_api_data_source.dart';
import 'package:movies/features/search/data/data_source/search_data_source.dart';

class ServiceLocator {
  static PopularDataSource popularDataSource = PopularApiDataSource();
  static UpcomimgDataSource upcomimgDataSource = UpcomingApiDataSource();
  static TopRatedDataSource topRatedDataSource = TopRatedApiDataSource();
  static SearchDataSource searchDataSource = SearchApiDataSource();
  static CategoriesDataSource categoriesDataSource = CategoriesApiDateSource();
  static MovieDetailsDataSource movieDetailsDataSource =
      MovieDetailsAPIDataSource();
}
