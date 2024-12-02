

import 'package:flutter/material.dart';
import 'package:movies/features/home/view/widgets/bottom_navigationbar.dart';
import 'package:movies/taps/browse.dart';
import 'package:movies/taps/home.dart';
import 'package:movies/taps/search.dart';
import 'package:movies/taps/watch_list.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;
  List<Widget> taps = [const Home(), const Search(), const Browse(), const WatchList()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: taps[selectedindex],
        bottomNavigationBar: BottomNavigationbar(
          ontapselected: onNavigationTap,
          selectedindex: selectedindex,
        ));
  }

  onNavigationTap(int tapedIndex) {
    selectedindex = tapedIndex;
    setState(() {});
  }
}
