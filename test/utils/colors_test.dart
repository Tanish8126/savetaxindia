import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:savetaxindia/utils/constants/colors.dart';

void main() {
  group('Color Constants Tests', () {
    test('should have correct primary color value', () {
      expect(kPrimary, const Color(0XFF010719));
      expect(kPrimary.r, 0XFF010719);
    });

    test('should have correct secondary color value', () {
      expect(kSecondary, const Color(0XFFD9D9D9));
      expect(kSecondary.r, 0XFFD9D9D9);
    });

    test('should have correct inactive color value', () {
      expect(kInactive, const Color(0XFF131313));
      expect(kInactive.r, 0XFF131313);
    });

    test('should have correct button color value', () {
      expect(kButton, const Color(0XFF4B4B4B));
      expect(kButton.r, 0XFF4B4B4B);
    });

    test('should have correct nav color value', () {
      expect(kNav, const Color(0XFF383838));
      expect(kNav.r, 0XFF383838);
    });

    test('should have correct pink color value', () {
      expect(kPink, const Color(0xffFF6B6B));
      expect(kPink.r, 0xffFF6B6B);
    });

    test('should have correct green color value', () {
      expect(kGreen, const Color(0XFFB6E388));
      expect(kGreen.r, 0XFFB6E388);
    });

    test('should have correct grey color value', () {
      expect(kGrey, const Color(0XFFD9D9D9));
      expect(kGrey.r, 0XFFD9D9D9);
    });

    test('should have correct transparent color', () {
      expect(ktrans, Colors.transparent);
      expect(ktrans.r, Colors.transparent.r);
    });

    test('should have correct white color', () {
      expect(kWhite, Colors.white);
      expect(kWhite.r, Colors.white.r);
    });

    test('should have correct black color', () {
      expect(kBlack, Colors.black);
      expect(kBlack.r, Colors.black.r);
    });

    test('should have correct blue color', () {
      expect(kBlue, Colors.blue);
      expect(kBlue.r, Colors.blue.r);
    });

    test('should have correct red color', () {
      expect(kRed, Colors.red);
      expect(kRed.r, Colors.red.r);
    });

    test('should have correct duration values', () {
      expect(kDuration1, const Duration(seconds: 5));
      expect(kDuration1.inSeconds, 5);

      expect(kDuration2, const Duration(seconds: 2));
      expect(kDuration2.inSeconds, 2);
    });

    test('should have different values for different colors', () {
      expect(kPrimary, isNot(equals(kSecondary)));
      expect(kSecondary, isNot(equals(kInactive)));
      expect(kInactive, isNot(equals(kButton)));
      expect(kButton, isNot(equals(kNav)));
      expect(kNav, isNot(equals(kPink)));
      expect(kPink, isNot(equals(kGreen)));
      expect(kGreen, isNot(equals(kGrey)));
    });

    test('should have correct color properties', () {
      expect(kPrimary.a, 1.0);
      expect(kSecondary.a, 1.0);
      expect(kInactive.a, 1.0);
      expect(kButton.a, 1.0);
      expect(kNav.a, 1.0);
      expect(kPink.a, 1.0);
      expect(kGreen.a, 1.0);
      expect(kGrey.a, 1.0);
    });

    test('should have correct alpha values', () {
      expect((kPrimary.a * 255).round(), 255);
      expect((kSecondary.a * 255).round(), 255);
      expect((kInactive.a * 255).round(), 255);
      expect((kButton.a * 255).round(), 255);
      expect((kNav.a * 255).round(), 255);
      expect((kPink.a * 255).round(), 255);
      expect((kGreen.a * 255).round(), 255);
      expect((kGrey.a * 255).round(), 255);
    });

    test('should have correct red, green, blue components', () {
      // Test primary color components
      expect((kPrimary.r * 255).round(), 1);
      expect((kPrimary.g * 255).round(), 7);
      expect((kPrimary.b * 255).round(), 25);

      // Test secondary color components
      expect((kSecondary.r * 255).round(), 217);
      expect((kSecondary.g * 255).round(), 217);
      expect((kSecondary.b * 255).round(), 217);

      // Test pink color components
      expect((kPink.r * 255).round(), 255);
      expect((kPink.g * 255).round(), 107);
      expect((kPink.b * 255).round(), 107);
    });

    test('should have correct color brightness', () {
      expect(kPrimary.computeLuminance(), lessThan(0.5)); // Dark color
      expect(kSecondary.computeLuminance(), greaterThan(0.5)); // Light color
      expect(kWhite.computeLuminance(), 1.0); // White
      expect(kBlack.computeLuminance(), 0.0); // Black
    });
  });
}
