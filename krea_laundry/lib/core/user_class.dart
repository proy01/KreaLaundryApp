class User {
  String? name;
  String? email;
  String? phoneNumber;
  int? roomNumber;

  String? get userName => name;
  String? get userPhone => phoneNumber;
  String? get userEmail => email;
  int? get room => roomNumber;

  Map<String, dynamic> getUserInfo() {
    return <String, dynamic>{
      'Name': name,
      'Phone Number': phoneNumber,
      'Email': email,
      'Room No.': roomNumber,
    };
  }

  set userName(String? n) => name = n;
  set userPhone(String? n) => phoneNumber = n;
  set room(int? n) => roomNumber = n;
}