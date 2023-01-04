import 'package:flutter/material.dart';

import '../../core/classes/krea_user.dart';

class IdArgs{
  final String id;

  IdArgs(this.id);
}

class ReceiveLaundryConfirm extends StatefulWidget {
  const ReceiveLaundryConfirm({Key? key}) : super(key: key);
  static final KreaUser user = KreaUser.login();

  @override
  State<ReceiveLaundryConfirm> createState() => _ReceiveLaundryConfirmState();
}

class _ReceiveLaundryConfirmState extends State<ReceiveLaundryConfirm> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as IdArgs;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Receive Laundry'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
              'Are you sure you have received this laundry? '
                  'This action cannot be reversed.', textAlign: TextAlign.center,),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('Cancel')),
                ElevatedButton(
                    onPressed: () {
                      try {
                        ReceiveLaundryConfirm.user.receiveLaundry(args.id);
                        Navigator.pop(context);
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: const Text('Yes')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
