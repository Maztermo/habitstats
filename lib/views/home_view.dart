import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/providers/home_page_controller.dart';
import 'package:habitstats/views/calendar_view.dart';
import 'package:habitstats/views/create_routine_view.dart';
import 'package:habitstats/views/stats_view.dart';
import 'package:habitstats/views/upcoming_view.dart';
import 'package:habitstats/widgets/bottom_nav_bar.dart';
import 'package:habitstats/widgets/flat_action_button.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        physics: const BouncingScrollPhysics(),
        onPageChanged: ref.read(homePageControllerProvider.notifier).makeSureNavBarIndexIsUpdated,
        controller: ref.watch(homePageControllerProvider).homePageController,
        children: const [
          UpcomingView(),
          CalendarView(),
          StatsView(),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
      floatingActionButton: FlatActionButton(iconData: Icons.add, onTap: () => Navigator.of(context).pushNamed(CreateRoutineView.routeId)),
    );
  }
}
