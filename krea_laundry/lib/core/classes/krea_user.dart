import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:krea_laundry/core/notification_services.dart';

import '../widgets/laundry_card.dart';

class KreaUser {
  final DatabaseReference usersDb =
      FirebaseDatabase.instance.ref('sample/users/');
  final DatabaseReference laundryDb =
      FirebaseDatabase.instance.ref('sample/laundry/');
  final User _user = FirebaseAuth.instance.currentUser!;

  /// Gets thr user's info into a map
  Map<String, String> userInfo() {
    return {
      'Name': _user.displayName!,
      'Email': _user.email!,
    };
  }

  /// Updates the database with the new user info
  void createNewUser() {
    usersDb.child('${_user.uid}/').set(userInfo());
  }

  /// Checks if the user is already on the database or not
  Future<bool> userExists() async {
    DataSnapshot userInfo = await usersDb.child('${_user.uid}/').get();
    return userInfo.exists;
  }

  /// Checks if the user is new and uploads their data onto firebase
  Future<void> isNewLogin() async {
    bool firstLogin = await userExists();
    if (!firstLogin) {
      createNewUser();
    }
  }

  /// This function creates a new laundry object and sets it in the database.
  Future<void> giveLaundry(String clothes, String undergarments, String totalClothes) async {
    NotificationServices().scheduleNotificationDemo(); // TODO: Change this non-demo when in proper use-case.
    DatabaseReference newLaundry = laundryDb.child('${_user.uid}/').push();
    await newLaundry.set({
      'Clothes': clothes,
      'Undergarments': undergarments,
      'Given': DateTime.now().toString(),
      'Received': false,
    });
    await laundryDb.child('${_user.uid}/clothes_given/${DateTime.now().year}/').update({
      DateTime.now().month.toString(): totalClothes,
    });
  }

  Future<int> checkClothes() async{
    final DataSnapshot currentValue = await laundryDb.child('${_user.uid}/clothes_given/${DateTime.now().year}/${DateTime.now().month}/').get();
    if (!currentValue.exists){
      return 0;
    } else {
      return int.parse(currentValue.value as String);
    }
  }

  /// Builds a list of LaundryCard widgets from existing laundry data.
  Future<List<LaundryCard>> getLaundryDetails() async {
    final DataSnapshot snapshot = await laundryDb.child(_user.uid).get();
    if (!snapshot.exists) {
      return [];
    } else {
      Map laundryData = snapshot.value as Map;
      List<LaundryCard> laundryCards = [];
      for (String e in laundryData.keys) {
        try {
          laundryCards.add(LaundryCard(
            clothes: laundryData[e]!['Clothes'],
            undergarments: laundryData[e]!['Undergarments'],
            givenDate: laundryData[e]!['Given'],
            received: laundryData[e]!['Received'],
            id: e,
          ));
        } catch (e) {
          debugPrint(e.toString());
        }
      }
      return laundryCards;
    }
  }

  Future<void> receiveLaundry(String id) async {
    laundryDb.child('${_user.uid}/$id/').update({'Received': true});
  }

  bool _isKreaEmail() {
    RegExp regExp1 = RegExp(r'(?<batch>[0-9][0-9])@krea.ac.in');
    // RegExpMatch? regExp3 = regExp1.firstMatch(email);
    // String? x = regExp3?.namedGroup('batch');
    return regExp1.hasMatch(_user.email!);
  }

  bool _isSIAS() {
    RegExp regExp2 = RegExp(r'(\b[a-z]+)_([a-z]+).sias[0-9][0-9]@krea.ac.in');
    return regExp2.hasMatch(_user.email!);
  }

  bool _isGSB() {
    RegExp regExp3 = RegExp(r'(\b[a-z]+)_([a-z]+).mba[0-9][0-9]@krea.ac.in');
    return regExp3.hasMatch(_user.email!);
  }

  bool isValidEmail(){
    if (_isKreaEmail()){
      if(_isSIAS()){
        return true;
      }else if(_isGSB()){
        return true;
      }
      else{
        return false;
      }
    }
    else{
      return false;
    }
  }

  String get name => _user.displayName!;

  String get email => _user.email!;

  /// Default constructor
  KreaUser.login();
}
