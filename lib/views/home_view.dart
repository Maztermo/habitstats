import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/providers/home_page_controller.dart';
import 'package:habitstats/views/create_routine_view.dart';
import 'package:habitstats/views/page123.dart';
import 'package:habitstats/widgets/bottom_navigation_bar.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yo I'm the AppBar"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pushNamed(CreateRoutineView.routeId),
            child: Text(
              'Create new routine',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          )
        ],
      ),
      body: PageView(
        physics: const BouncingScrollPhysics(),
        onPageChanged: ref.read(homePageControllerProvider.notifier).makeSureNavBarIndexIsUpdated,
        controller: ref.watch(homePageControllerProvider).homePageController,
        children: const [
          Page1(),
          Page2(),
          Page3(),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
