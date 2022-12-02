import 'package:flutter/material.dart';
import 'package:krea_laundry/screens/home_page.dart';

final Map<String, Widget Function(BuildContext)> mainRoutes = {
  '/' : (context) => const MyHomePage(title: "Krea Laundry"),
  '/confirmscan' : (context) => const MyHomePage(title: "Krea Laundry"), // TODO: Add a page that scans a qr code for confirmation of location.
  '/pastlaundry' : (context) => const MyHomePage(title: "Krea Laundry") // TODO: Add a past laundry given tracker
};