import 'package:flutter/material.dart';
import 'package:krea_laundry/screens/auth/invalid_user.dart';
import 'package:krea_laundry/screens/confirm/confirm_receive.dart';
import 'package:krea_laundry/screens/give_laundry/give_laundry.dart';
import 'package:krea_laundry/screens/auth/home_auth.dart';
import 'package:krea_laundry/screens/home_page.dart';
import 'package:krea_laundry/screens/main_screens/laundry_page_two.dart';

final Map<String, Widget Function(BuildContext)> mainRoutes = {
  '/signIn': (context) => const MainAuth(),
  '/signIn/invalidUser': (context) => InvalidUser(),
  '/home' : (context) => const MyHomePage(title: "Krea Laundry"),
  '/home/give': (context) => const GiveLaundry(),
  '/home/get' : (context) => const LaundryPageTwo(),
  '/home/get/confirm': (context) => ReceiveLaundryConfirm(key: UniqueKey(),),
};