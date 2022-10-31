import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class HomePageState extends Equatable {
  final int bottomNavBarIndex;
  final PageController homePageController;

  const HomePageState({
    required this.bottomNavBarIndex,
    required this.homePageController,
  });

  HomePageState copyWith({
    final int? bottomNavBarIndex,
    final PageController? homePageController,
  }) =>
      HomePageState(
        bottomNavBarIndex: bottomNavBarIndex ?? this.bottomNavBarIndex,
        homePageController: homePageController ?? this.homePageController,
      );

  @override
  List<Object?> get props => [
        bottomNavBarIndex,
        homePageController,
      ];
}
