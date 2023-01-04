import 'package:flutter/material.dart';

import '../../core/classes/krea_user.dart';
import '../../core/widgets/laundry_card.dart';

class LaundryPageTwo extends StatefulWidget {
  const LaundryPageTwo({Key? key}) : super(key: key);


  @override
  State<LaundryPageTwo> createState() => _LaundryPageTwoState();
}

class _LaundryPageTwoState extends State<LaundryPageTwo> {
  static final KreaUser user = KreaUser.login();
  final Future<List<LaundryCard>> _cards = user.getLaundryDetails();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Past Laundry'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: _cards,
            builder: (BuildContext context, AsyncSnapshot<List<LaundryCard>> snap){
              if (snap.hasData && snap.data!.isNotEmpty){
                return Center(
                  child: Column(
                    children: [
                      ...snap.data!,
                    ],
                  ),
                );
              } else if (snap.hasData && snap.data!.isEmpty){
                return const Center(child: Text("You haven't given any laundry yet"));
              }
              else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}