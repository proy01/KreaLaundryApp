import 'package:flutter/material.dart';
import 'package:krea_laundry/screens/give_laundry/give_laundry.dart';
import 'package:krea_laundry/screens/home_auth.dart';
import 'package:krea_laundry/screens/home_page.dart';

final Map<String, Widget Function(BuildContext)> mainRoutes = {
  '/signIn': (context) => const MainAuth(),
  '/home' : (context) => const MyHomePage(title: "Krea Laundry"),
  '/home/give': (context) => const GiveLaundry(),
  '/home/get' : (context) => const Text('Pause'),
  '/confirmscan' : (context) => const MyHomePage(title: "Krea Laundry"), // TODO: Add a page that scans a qr code for confirmation of location.
};