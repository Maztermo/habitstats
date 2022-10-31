import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/providers/home_page_state.dart';

final homePageControllerProvider = StateNotifierProvider<SetupController, HomePageState>(
  (ref) => SetupController(
      // Initial setup
      HomePageState(
    bottomNavBarIndex: 0,
    homePageController: PageController(keepPage: false),
  )),
);

class SetupController extends StateNotifier<HomePageState> {
  SetupController(
    HomePageState state,
  ) : super(state) {
    initialAsyncSetup();
  }

  Future<void> initialAsyncSetup() async {}

  void bottomNavBarItemTapped(int newIndex) {
    HapticFeedback.selectionClick();
    state.homePageController.jumpToPage(newIndex);
    state = state.copyWith(bottomNavBarIndex: newIndex);
  }

  makeSureNavBarIndexIsUpdated(int index) {
    if (state.bottomNavBarIndex != index) {
      state = state.copyWith(bottomNavBarIndex: index);
    }
  }
}
