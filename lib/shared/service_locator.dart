import 'package:movies/features/home/data/data_source/popular_movies/popular_api_data_source.dart';
import 'package:movies/features/home/data/data_source/popular_movies/popular_data_source.dart';
import 'package:movies/features/home/data/data_source/top_rated_movies/top_rated_api_data_source.dart';
import 'package:movies/features/home/data/data_source/top_rated_movies/top_rated_data_source.dart';
import 'package:movies/features/home/data/data_source/upcoming_movies/upcomimg_data_source.dart';
import 'package:movies/features/home/data/data_source/upcoming_movies/upcoming_api_data_source.dart';

class ServiceLocator {
  static PopularDataSource popularDataSource = PopularApiDataSource();
  static UpcomimgDataSource upcomimgDataSource = UpcomingApiDataSource();
  static TopRatedDataSource topRatedDataSource = TopRatedApiDataSource();
}
