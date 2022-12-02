import 'package:flutter/material.dart';
import 'package:krea_laundry/main_routes.dart';
import 'ui/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Krea Laundry App',
      theme: laundryTheme,
      routes: mainRoutes,
    );
  }
}