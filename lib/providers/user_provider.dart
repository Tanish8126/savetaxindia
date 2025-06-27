import 'package:flutter/material.dart';

import '../models/formdata_model.dart';

class UserProvider extends ChangeNotifier {
  SignUpFormData _user = SignUpFormData(
    uid: '',
    phoneNumber: '',
    email: '',
    userName: '',
    photoUrl: '',
    bio: '',
  );

  SignUpFormData get user => _user;

  void setUser(SignUpFormData user) {
    _user = user;
    notifyListeners();
  }
}
