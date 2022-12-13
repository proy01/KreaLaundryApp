import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LaundryCard extends StatelessWidget {
  LaundryCard({
    Key? key,
    required this.clothes,
    required this.undergarments,
    required this.givenDate,
    required this.received,
  }) : super(key: key);

  String? clothes;
  String? undergarments;
  String givenDate;
  bool received;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.local_laundry_service),
            title: Text('Laundry given on $givenDate'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                const SizedBox(height:10),
                Text('Clothes: $clothes'),
                Text('Undergarments: $undergarments')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                ElevatedButton(onPressed: null, child: Text('Received')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

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
      return [];
    } else {
      Map<String, dynamic> laundryData = snapshot.value as Map<String, dynamic>;
      List<LaundryCard> laundryCards = [];
      for (String e in laundryData.keys) {
        try {
          laundryCards.add(LaundryCard(
            clothes: laundryData[e]['Clothes'],
            undergarments: laundryData[e]['Undergarments'],
            givenDate: laundryData[e]['Given'],
            received: laundryData[e]['Received'],
          ));
        } catch (e) {
          debugPrint(e.toString());
        }
      }
      return laundryCards;
    }
  }

  String get name => _user.displayName!;

  String get email => _user.email!;

  /// Default constructor
  KreaUser.login();
}
