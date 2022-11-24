import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/constants/navigation_routes.dart';
import 'package:habitstats/services/db_service.dart';
import 'package:habitstats/services/shared_preferences_service.dart';
import 'package:habitstats/themes.dart';
import 'package:habitstats/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.ensureInitialized();
  await DataBaseService.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habit Stats',
      theme: darkTheme,
      home: const HomeView(),
      routes: navigationRoutes,
    );
  }
}
