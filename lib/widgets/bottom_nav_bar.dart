import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/providers/home_page_controller.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      items: bottomNavigationBarItems,
      currentIndex: ref.watch(homePageControllerProvider).bottomNavBarIndex,
      onTap: ref.read(homePageControllerProvider.notifier).bottomNavBarItemTapped,
    );
  }
}

const bottomNavigationBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.inbox_outlined),
    activeIcon: Icon(Icons.inbox),
    label: 'Upcoming',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.calendar_month_outlined),
    activeIcon: Icon(Icons.calendar_month),
    label: 'Calendar',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.bar_chart_outlined),
    activeIcon: Icon(Icons.bar_chart),
    label: 'Stats',
  ),
];
