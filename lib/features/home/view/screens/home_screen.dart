import 'package:flutter/material.dart';
import 'package:movies/features/home/view/widgets/bottom_navigationbar.dart';
import 'package:movies/features/browse/view/widgets/browse_tab.dart';
import 'package:movies/features/home/view/widgets/home_tab.dart';
import 'package:movies/features/search/view/widgets/search_tab.dart';
import 'package:movies/features/watch_list/view/widgets/watch_list_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;
  List<Widget> taps = [
    const HomeTab(),
    const SearchTab(),
    const BrowseTab(),
    const WatchListTab()
  ];
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
