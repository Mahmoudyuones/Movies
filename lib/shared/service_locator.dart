import 'package:movies/features/home/data/data_source/popular_movies/popular_api_data_source.dart';
import 'package:movies/features/home/data/data_source/popular_movies/popular_data_source.dart';

class ServiceLocator {
  static PopularDataSource popularDataSource = PopularApiDataSource();
  
}
