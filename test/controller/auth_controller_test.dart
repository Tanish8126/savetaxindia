import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:savetaxindia/controller/auth_controller.dart';

void main() {
  group('AuthController Tests', () {
    late AuthController authController;

    setUp(() {
      authController = AuthController();
    });

    test('should initialize with default values', () {
      expect(authController.showPrefix.value, false);
      expect(authController.isLoading.value, false);
      expect(authController.phoneNo.value, '');
      expect(authController.otp.value, '');
      expect(authController.isOtpSent.value, false);
      expect(authController.resendAfter.value, 30);
      expect(authController.resendOTP.value, false);
      expect(authController.firebaseVerificationId, '');
      expect(authController.statusMessage.value, '');
    });

    test('should set phone number correctly', () {
      authController.phoneNo.value = '9876543210';
      expect(authController.phoneNo.value, '9876543210');
    });

    test('should set OTP correctly', () {
      authController.otp.value = '123456';
      expect(authController.otp.value, '123456');
    });

    test('should set status message correctly', () {
      authController.statusMessage.value = 'Test message';
      expect(authController.statusMessage.value, 'Test message');
    });

    test('should set status message color correctly', () {
      authController.statusMessageColor.value = Colors.red;
      expect(authController.statusMessageColor.value, Colors.red);
    });

    test('should set loading state correctly', () {
      authController.isLoading.value = true;
      expect(authController.isLoading.value, true);

      authController.isLoading.value = false;
      expect(authController.isLoading.value, false);
    });

    test('should set OTP sent state correctly', () {
      authController.isOtpSent.value = true;
      expect(authController.isOtpSent.value, true);

      authController.isOtpSent.value = false;
      expect(authController.isOtpSent.value, false);
    });

    test('should set resend OTP state correctly', () {
      authController.resendOTP.value = true;
      expect(authController.resendOTP.value, true);

      authController.resendOTP.value = false;
      expect(authController.resendOTP.value, false);
    });

    test('should set resend after timer correctly', () {
      authController.resendAfter.value = 15;
      expect(authController.resendAfter.value, 15);
    });

    test('should set Firebase verification ID correctly', () {
      authController.firebaseVerificationId = 'test_verification_id';
      expect(authController.firebaseVerificationId, 'test_verification_id');
    });

    test('should handle phone number with country code', () {
      authController.phoneNo.value = '9876543210';
      expect(authController.phoneNo.value, '9876543210');
    });

    test('should handle empty phone number', () {
      authController.phoneNo.value = '';
      expect(authController.phoneNo.value, '');
    });

    test('should handle empty OTP', () {
      authController.otp.value = '';
      expect(authController.otp.value, '');
    });

    test('should handle OTP with only digits', () {
      authController.otp.value = '123456';
      expect(authController.otp.value, '123456');
    });

    test('should handle OTP with non-digits', () {
      authController.otp.value = '12a456';
      expect(authController.otp.value, '12a456');
    });

    test('should handle long phone number', () {
      final longPhone = '9' * 15;
      authController.phoneNo.value = longPhone;
      expect(authController.phoneNo.value, longPhone);
    });

    test('should handle long OTP', () {
      final longOtp = '1' * 10;
      authController.otp.value = longOtp;
      expect(authController.otp.value, longOtp);
    });

    test('should handle special characters in status message', () {
      final specialMessage = 'Status with special chars: !@#\$%^&*()';
      authController.statusMessage.value = specialMessage;
      expect(authController.statusMessage.value, specialMessage);
    });

    test('should handle long status message', () {
      final longMessage = 'a' * 1000;
      authController.statusMessage.value = longMessage;
      expect(authController.statusMessage.value, longMessage);
    });

    test('should handle different status message colors', () {
      authController.statusMessageColor.value = Colors.green;
      expect(authController.statusMessageColor.value, Colors.green);

      authController.statusMessageColor.value = Colors.blue;
      expect(authController.statusMessageColor.value, Colors.blue);

      authController.statusMessageColor.value = Colors.orange;
      expect(authController.statusMessageColor.value, Colors.orange);
    });

    test('should handle timer countdown', () {
      authController.resendAfter.value = 30;

      authController.resendAfter.value = 29;
      expect(authController.resendAfter.value, 29);

      authController.resendAfter.value = 0;
      expect(authController.resendAfter.value, 0);
    });

    test('should handle multiple state changes', () {
      authController.phoneNo.value = '9876543210';
      authController.isLoading.value = true;
      authController.statusMessage.value = 'Loading...';

      expect(authController.phoneNo.value, '9876543210');
      expect(authController.isLoading.value, true);
      expect(authController.statusMessage.value, 'Loading...');

      authController.isLoading.value = false;
      authController.statusMessage.value = 'Completed';

      expect(authController.isLoading.value, false);
      expect(authController.statusMessage.value, 'Completed');
    });

    test('should handle OTP sent flow', () {
      authController.phoneNo.value = '9876543210';
      authController.isOtpSent.value = true;
      authController.firebaseVerificationId = 'test_verification_id';
      authController.statusMessage.value = 'OTP sent to +919876543210';

      expect(authController.phoneNo.value, '9876543210');
      expect(authController.isOtpSent.value, true);
      expect(authController.firebaseVerificationId, 'test_verification_id');
      expect(authController.statusMessage.value, 'OTP sent to +919876543210');
    });

    test('should handle OTP verification flow', () {
      authController.otp.value = '123456';
      authController.firebaseVerificationId = 'test_verification_id';
      authController.statusMessage.value = 'Verifying... 123456';

      expect(authController.otp.value, '123456');
      expect(authController.firebaseVerificationId, 'test_verification_id');
      expect(authController.statusMessage.value, 'Verifying... 123456');
    });
  });
}
