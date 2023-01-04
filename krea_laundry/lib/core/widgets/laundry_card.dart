import 'package:flutter/material.dart';

import '../../screens/confirm/confirm_receive.dart';

class LaundryCard extends StatefulWidget {
  LaundryCard({
    Key? key,
    required this.clothes,
    required this.undergarments,
    required this.givenDate,
    required this.received,
    required this.id,
  }) : super(key: key);

  String? clothes;
  String? undergarments;
  String givenDate;
  bool received;
  String id;

  @override
  State<LaundryCard> createState() => _LaundryCardState();
}

class _LaundryCardState extends State<LaundryCard> {
  @override
  Widget build(BuildContext context) {
    DateTime currDate = DateTime.parse(widget.givenDate);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.local_laundry_service),
            title: Text(
                'Laundry given on ${currDate.day}/${currDate.month}/${currDate.year}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                const SizedBox(height: 10),
                Text('Clothes: ${widget.clothes}'),
                Text('Undergarments: ${widget.undergarments}')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: widget.received ? null : (){
                      Navigator.pushNamed(context, '/home/get/confirm', arguments: IdArgs(widget.id)).then((_) => Navigator.pushReplacementNamed(context, '/home/get'));
                    },
                    child: widget.received ? const Text('Received') : const Text('Receive'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
