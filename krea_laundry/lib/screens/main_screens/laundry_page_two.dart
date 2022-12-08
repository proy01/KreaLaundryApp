import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../core/classes/laundry.dart';

class LaundryPageTwo extends StatelessWidget {
  const LaundryPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder(
          stream: FirebaseDatabase.instance.ref('sample/laundry/${FirebaseAuth.instance.currentUser!.uid}').onValue,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if (snapshot.connectionState == ConnectionState.active){
              DatabaseEvent snap = snapshot.data;
              return Column(
                children: [
                  Text(snap.snapshot.value.toString()),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }
}