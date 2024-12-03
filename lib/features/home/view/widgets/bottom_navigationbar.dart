import 'package:flutter/material.dart';

class BottomNavigationbar extends StatelessWidget {
  const BottomNavigationbar(
      {super.key, required this.selectedindex, required this.ontapselected});
  final int selectedindex;
  final Function(int) ontapselected;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedindex,
      onTap: (index) {
        ontapselected(index);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'HOME',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'SEARCH',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: 'BROWSE',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.collections_bookmark_outlined,
          ),
          label: 'WatchListTab',
        ),
      ],
    );
  }
}
