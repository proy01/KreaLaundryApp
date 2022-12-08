import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:krea_laundry/core/classes/user_class.dart';

class Laundry {
  int? clothes;
  int? undergarments;
  DateTime givenDate;
  bool received;
  String givenBy = FirebaseAuth.instance.currentUser!.uid;

  Laundry(this.givenDate, this.received);

  Widget laundryCard() {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.local_laundry_service),
            title: Text('Laundry given on ${DateFormat.yMMMEd().format(DateTime.now())}'),
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