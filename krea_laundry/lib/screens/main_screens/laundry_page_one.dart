import 'package:flutter/material.dart';

class LaundryPageOne extends StatelessWidget {
  const LaundryPageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 12),
            child: Text('Welcome To \nKrea Laundry', style: Theme.of(context).textTheme.headline1,),
          ),
          const SizedBox(height: 20,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Divider(color: Colors.grey, thickness: 1,),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          )
        ],
      ),
    );
  }
}
