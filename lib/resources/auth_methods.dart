import 'package:cloud_firestore/cloud_firestore.dart';

class AuthMethods {
  final _userRef = FirebaseFirestore.instance.collection('userData');

  //==================Get Current User==================
  Future<Map<String, dynamic>?> getCurrentUser(String? uid) async {
    if (uid != null) {
      final snap = await _userRef.doc(uid).get();
      return snap.data();
    }
    return null;
  }

  // //==================Get User Data==================
  // Future<SignUpFormData> getUserData() async {
  //   var uid = _auth.currentUser!.uid;
  //   DocumentSnapshot snapshot = await _userRef.doc(uid).get();
  //   return SignUpFormData.fromMap(snapshot as Map<String, dynamic>);
  // }

  //==================Get User Data==================
  Future<Map<String, dynamic>?> getUserdata(String? uid) async {
    if (uid != null) {
      final snap = await _userRef
          .doc(uid)
          .collection("UserData")
          .doc(uid)
          .get();
      return snap.data();
    }
    return null;
  }
}
