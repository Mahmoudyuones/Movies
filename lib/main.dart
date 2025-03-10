import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies/features/browse/view/screens/catedory_details.dart';
import 'package:movies/features/home/view/screens/home_screen.dart';
import 'package:movies/features/watch_list/view_model/watch_list_view_model.dart';
import 'package:movies/shared/app_theme/app_theme.dart';
import 'package:movies/shared/screens/movie_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("favorites");
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WatchListViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routeName: (_) => const HomeScreen(),
          MovieDetails.routeName: (_) => const MovieDetails(),
          CatedoryDetails.routeName: (_) => const CatedoryDetails(),
        },
        initialRoute: HomeScreen.routeName,
        theme: AppTheme.lightPrimary,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
