import 'package:email_validator/email_validator.dart';

void main() {
  // print("Enter your email: ");
  const String userid = 'pronoy_roy.mba@krea.ac.in';
  final bool isEmail = EmailValidator.validate(userid);
  if(isEmail & isKreaEmail(userid)){
    if(isSIAS(userid)){
      print('SIAS email accepted');
    }else if(isGSB(userid)){
      print('GSB email accepted');
    }else{
      print("Enter a valid email");
    }
  }
  else{
    print("Enter a valid email");
  }
}

bool isKreaEmail(String email) {
  // String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp1 = RegExp(r'@krea.ac.in');
  return regExp1.hasMatch(email);
}

bool isSIAS(String email) {
  RegExp regExp2 = RegExp(r'[a-z]_[a-z].sias[0-9][0-9]@krea.ac.in');
  return regExp2.hasMatch(email);
}

bool isGSB(String email) {
  RegExp regExp3 = RegExp(r'[a-z]_[a-z].mba[0-9][0-9]@krea.ac.in');
  return regExp3.hasMatch(email);
}

// bool prefix(String email) {
//   String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//   RegExp regExp4 = RegExp(r'[a-z]');
// }

