import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/classes/krea_user.dart';

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

  final KreaUser user = KreaUser.login();

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
                        validator: (val) {
                          int x = 0;
                          // ERROR CODES:
                          // 0 is all ok,
                          // 1 is empty, 2 is greater than 20,
                          // 3 is less than 0, 4 is letter found
                          if (val == null || val.isEmpty){
                            x = 1;
                          } else {
                            try {
                              if (x != 1) {
                                int number = int.parse(val);
                                if (number > 20) {
                                  x = 2;
                                } else if (number < 0) {
                                  x = 3;
                                }
                              }
                            } catch (e) {
                              x = 4;
                            }
                          }
                          if (x == 1) {
                            return 'Value cannot be empty, put 0 instead';
                          } else if (x == 2) {
                            return 'For above 20 clothes, please approach laundry';
                          } else if (x == 3) {
                            return 'Wrong Input';
                          } else if (x == 4) {
                            return 'Put only numbers please';
                          }
                          // TODO: Make this into a switch case
                          return null;
                        },
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
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Value cannot be empty, put 0 instead';
                          } else if (int.parse(val) < 0) {
                            return 'Wrong Input';
                          }
                          return null;
                        },
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
                  ElevatedButton(
                      onPressed: () async {
                       if (_formKey.currentState!.validate()) {
                         await user.giveLaundry(
                             clothes.text, undergarments.text);
                         if (mounted) {
                           Navigator.pop(context);
                         }
                       }
                      },
                      child: const Text("Submit")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
