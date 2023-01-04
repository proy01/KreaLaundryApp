import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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
  Future<void> giveLaundry(String clothes, String undergarments) async {
    DatabaseReference newLaundry = laundryDb.child('${_user.uid}/').push();
    newLaundry.set({
      'Clothes': clothes,
      'Undergarments': undergarments,
      'Given': DateTime.now().toString(),
      'Received': false,
    });
  }

  /// Builds a list of LaundryCard widgets from existing laundry data.
  Future<List<LaundryCard>> getLaundryDetails() async {
    final DataSnapshot snapshot = await laundryDb.child(_user.uid).get();
    if (!snapshot.exists) {
      print("!snapshot.exists");
      return [];
    } else {
      print(snapshot.value);
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

  String get name => _user.displayName!;

  String get email => _user.email!;

  /// Default constructor
  KreaUser.login();
}
