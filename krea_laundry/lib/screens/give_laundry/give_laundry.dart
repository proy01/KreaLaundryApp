import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GiveLaundry extends StatefulWidget {
  const GiveLaundry({Key? key}) : super(key: key);

  @override
  State<GiveLaundry> createState() => _GiveLaundryState();
}

class _GiveLaundryState extends State<GiveLaundry> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController clothes = TextEditingController();
  final TextEditingController undergarments = TextEditingController();
  List<TextInputFormatter> numberFormat = <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Please input the number of clothes you want to give:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                        width: 130,
                        child: Text(
                          "Clothes: ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        controller: clothes,
                        keyboardType: TextInputType.number,
                        // TODO validator: ,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                        width: 130,
                        child: Text(
                          "Undergarments: ",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        controller: undergarments,
                        keyboardType: TextInputType.number,
                        // TODO validator: ,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text("Submit")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
