import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class KreaUser {
  User user = FirebaseAuth.instance.currentUser!;
  final DatabaseReference ref = FirebaseDatabase.instance.ref('sample/laundry/');

  Future<void> giveLaundry(int clothes, int undergarments) async {
    ref.child('${user.uid}/${DateTime.now()}/').set(
      {
        'Clothes' : clothes,
        'Undergarments' : undergarments,
        'Received' : false,
      }
    );
  }
}