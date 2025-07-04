import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/post_data_methods.dart';
import '../screens/home/bottom_nav/bottom_nav.dart';
import '../utils/constants/constants.dart';
import '../utils/snackbar.dart';

class AuthController extends GetxController with StateMixin {
  final _auth = FirebaseAuth.instance;

  var showPrefix = false.obs;
  RxBool isLoading = false.obs;
  var phoneNo = "".obs;
  var otp = "".obs;
  var isOtpSent = false.obs;
  var resendAfter = 30.obs;
  var resendOTP = false.obs;
  var firebaseVerificationId = "";
  var statusMessage = "".obs;
  var statusMessageColor = kBlack.obs;

  dynamic timer;

  AuthController();

  // void checkLogin() async {
  //   final SharedPreferences s = await SharedPreferences.getInstance();
  //   isLogin = s.getBool("is_login") ?? false;
  // }

  Future<void> getOtp(BuildContext context) async {
    change(null, status: RxStatus.loading());

    isLoading.value = true;
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: '+91${phoneNo.value}',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          throw Exception(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          firebaseVerificationId = verificationId;
          isOtpSent.value = true;
          statusMessage.value = "OTP sent to +91${phoneNo.value}";
          startResendOtpTimer();
          isLoading.value = false;
          update();
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.message.toString());
      } else {
        Get.snackbar(
          'Error',
          e.message.toString(),
          backgroundColor: kBlack,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  //==================Resend OTP==================
  Future<void> resendOtp() async {
    resendOTP.value = false;
    _auth.verifyPhoneNumber(
      phoneNumber: '+91${phoneNo.value}',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        firebaseVerificationId = verificationId;
        isOtpSent.value = true;
        statusMessage.value = "OTP re-sent to +91${phoneNo.value}";
        startResendOtpTimer();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  //==================Verify OTP==================
  Future<void> verifyOTP() async {
    try {
      statusMessage.value = "Verifying... ${otp.value}";
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: firebaseVerificationId,
        smsCode: otp.value,
      );
      // Sign the user in (or link) with the credential
      await _auth.signInWithCredential(credential).then((value) {
        if (value.user != null) {
          final useruid = value.user!.uid;
          final timestamp = value.user!.metadata.creationTime;
          PostDataMethods().postMobileData(useruid, phoneNo.value, timestamp!);
          Get.offAllNamed(MainScreen.routeName);
        }
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.message.toString(),
        backgroundColor: kBlack,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //==================Start Resend OTP Timer==================
  void startResendOtpTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendAfter.value != 0) {
        resendAfter.value--;
      } else {
        resendAfter.value = 30;
        resendOTP.value = true;
        timer.cancel();
      }
      update();
    });
  }
}
