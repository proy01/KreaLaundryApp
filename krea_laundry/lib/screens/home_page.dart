import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krea_laundry/screens/main_screens/laundry_page_one.dart';
import 'package:krea_laundry/screens/main_screens/laundry_page_two.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _bottomIndex = 0;

  List homeScreens = <Widget>[
    LaundryPageOne(key: UniqueKey(),),
    LaundryPageTwo(key: UniqueKey(),),
  ];

  void changePage(int index){
    setState(() {
      _bottomIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (mounted){
                Navigator.pushReplacementNamed(context, '/signIn');
              }
            }, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.logout),
                    Text("Log Out"),
                  ],
                ),
              ),
            ),),
            const SizedBox(height: 10,),
          ],
        ),
      ),
      body: homeScreens.elementAt(_bottomIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.local_laundry_service_sharp), label: "Laundry"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: "Past Tracking"),
        ],
        selectedItemColor: Colors.deepOrangeAccent,
        onTap: changePage,
        currentIndex: _bottomIndex,
      ),
    );
  }
}
