import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:movies/features/home/view/widgets/bottom_navigationbar.dart';
import 'package:movies/features/browse/view/widgets/browse_tab.dart';
import 'package:movies/features/home/view/screens/home_tab.dart';
import 'package:movies/shared/widgets/network_faild.dart';
import 'package:movies/features/search/view/widgets/search_tab.dart';
import 'package:movies/features/watch_list/view/screens/watch_list_tab.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';

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

  Future<bool> checkConnectivity() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<bool>(
        future: checkConnectivity(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: LoadingIndicator(),
            );
          } else if (snapshot.hasData && snapshot.data == true) {
            return Scaffold(
              body: taps[selectedindex],
              bottomNavigationBar: BottomNavigationbar(
                ontapselected: onNavigationTap,
                selectedindex: selectedindex,
              ),
            );
          } else {
            return  Scaffold(
              body: NetWorkFaild(onPressed: onRetryPressed,),
            );
          }
        },
      ),
    );
  }

  void onNavigationTap(int tapedIndex) {
    selectedindex = tapedIndex;
    setState(() {});
  }

  void onRetryPressed(){
    setState(() {
      
    });
  }
}
