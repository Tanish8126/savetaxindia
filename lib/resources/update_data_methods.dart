import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateDataMethods {
  final _userRef = FirebaseFirestore.instance;

  //================USER RELATED============//

// Update user data
  Future<void> updateUserData(String name, email, phone, uid) async {
    await _userRef
        .doc(uid)
        .update({"userName": name, "email": email, "phoneNumber": phone});
  }
}
