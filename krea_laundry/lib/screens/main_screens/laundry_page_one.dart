import 'package:flutter/material.dart';

class LaundryPageOne extends StatelessWidget {
  const LaundryPageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/home/give'),
            child: const Text("Give Laundry"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/home/get'),
            child: const Text("Receive Laundry"),
          ),
        ],
      ),
    );
  }
}
