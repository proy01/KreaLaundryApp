import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class UserLogin {
  final DatabaseReference ref = FirebaseDatabase.instance.ref('sample/users/');
  User user = FirebaseAuth.instance.currentUser!;


  Map<String, String> userInfo(){
    return {
      'Name' : user.displayName!,
      'Email' : user.email!,
    };
  }

  void createNewUser() {
    ref.child('${user.uid}/').set(userInfo());
  }

  Future<bool> userExists() async {
    DataSnapshot userInfo = await ref.child('${user.uid}/').get();
    return userInfo.exists;
  }

  Future<void> isNewLogin() async {
    bool firstLogin = await userExists();
    if (!firstLogin){
      createNewUser();
    }
  }

  UserLogin.login();
}