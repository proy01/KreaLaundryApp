import 'package:email_validator/email_validator.dart';

void main() {
  // print("Enter your email: ");
  const String userid = 'dfg_r.sias12@krea.ac.in';
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
  RegExp regExp1 = RegExp(r'(?<batch>[0-9][0-9])@krea.ac.in');
  RegExpMatch? regExp3 = regExp1.firstMatch(email);
  String? x = regExp3?.namedGroup('batch');
  return regExp1.hasMatch(email);
}

bool isSIAS(String email) {
  RegExp regExp2 = RegExp(r'(\b[a-z]+)_([a-z]+).sias[0-9][0-9]@krea.ac.in');
  return regExp2.hasMatch(email);
}

bool isGSB(String email) {
  RegExp regExp3 = RegExp(r'(\b[a-z]+)_([a-z]+).mba[0-9][0-9]@krea.ac.in');
  return regExp3.hasMatch(email);}


// void main() {
//   const String user = 'seema_vish.mba29@krea.ac.in';
//
//   RegExp regExp2 = RegExp(r'(?<batch>[0-9][0-9])@krea.ac.in');
//   RegExpMatch? regExp3 = regExp2.firstMatch(user);
//   String? x = regExp3?.namedGroup('batch');
//
//   if (regExp2.hasMatch(user)){
//     if(isSIAS(user)){
//       print(x);
//       print("is sias");
//     }else if(isGSB(user)){
//       print(x);
//       print("is GSB");
//     }
//     else{
//       print("invalid");
//     }
//   }
//   else{
//     print('invalid');
//   }
// }

