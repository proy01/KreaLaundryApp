import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InvalidUser extends StatefulWidget {
  @override
  State<InvalidUser> createState() => _InvalidUserState();
}

class _InvalidUserState extends State<InvalidUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invalid User'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const
              Text(
                'Error in the input email!',),
              const SizedBox(height:50),
              ElevatedButton(onPressed: () async {
                await FirebaseAuth.instance.signOut();
                if (mounted){
                  Navigator.pushReplacementNamed(context, '/signIn');
                }
              }, child: Text('Sign Out'),),
            ],),
      ),
    );
  }
}
