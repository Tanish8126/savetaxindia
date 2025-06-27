class SignUpFormData {
  final String uid;
  final String photoUrl;
  final String userName;
  final String email;
  final String phoneNumber;
  final String bio;

  SignUpFormData({
    required this.uid,
    required this.phoneNumber,
    required this.email,
    required this.photoUrl,
    required this.userName,
    required this.bio,
  });
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'photoUrl': photoUrl,
      'userName': userName,
      'email': email,
      'phonenumber': phoneNumber,
      'bio': bio,
    };
  }

  factory SignUpFormData.fromMap(Map<String, dynamic> map) {
    return SignUpFormData(
      photoUrl: map['photoUrl'] ?? '',
      uid: map['uid'] ?? '',
      userName: map['userName'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      bio: map['bio'] ?? '',
    );
  }
}
