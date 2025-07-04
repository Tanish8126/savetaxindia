import 'package:flutter/material.dart';

class Perquiste {
  //----------------------Leave Travel Concession---------------//
  dynamic leave() {}

  //--------------------Medical Facility---------------------//
  dynamic medical() {}

  //----------------Loan--------------------//
  dynamic loan(int amt, actual) {
    //if taken for specified disease not taxable
    if (amt > 20000) {
      num value1 = amt * (4 - 6);
      return value1;
    } else {
      return Text("Not Taxable");
    }
  }

  //--------------Gift from ER---------------//
  dynamic gift(int amt, Object cash) {
    if (amt == cash) {
      int value1 = amt;
      return value1;
    } else {
      if (amt < 5000) {
        Text("Not Taxable");
      } else {
        num value1 = amt;
        return value1;
      }
    }
  }

  //-------------------ESOP------------------//
  num esop(int fmv, issueprice) {
    num value2 = fmv - issueprice;
    return value2;
  }

  //---------------------Use of Movable Asset----------------------//
  void useofmovable() {}

  //-------------------Transfer of Movable Assets------------------//

  //=============Computers=============//

  double transferofcomputers({
    required double initialValue,
    required int years,
    double rate = 0.5, // 50% depreciation rate
  }) {
    double value = initialValue;
    for (int i = 0; i < years; i++) {
      value = value * (1 - rate);
    }
    return value;
  }

  //=============Cars=============//

  double transferofcars({
    required double initialValue,
    required int years,
    double rate = 0.2, // 20% depreciation rate
  }) {
    double value = initialValue;
    for (int i = 0; i < years; i++) {
      value = value * (1 - rate);
    }
    return value;
  }

  //=============Other Movable Assets=============//

  double depreciatedValueSLM({
    required double initialValue,
    required int years,
    double rate = 0.10, // 10% depreciation rate per year
  }) {
    double depreciationPerYear = initialValue * rate;
    double totalDepreciation = depreciationPerYear * years;
    double value = initialValue - totalDepreciation;
    // Asset value cannot be negative
    return value < 0 ? 0 : value;
  }

  //----------------------Lunch--------------------//
  int lunch(int price) {
    var value1 = price - 50;
    return value1;
  }

  //Employer contribution towards RPF, ASF & NPS [Sec 17(2)(vii)]

  //-----------------Motor car facility---------------------//
  dynamic motor() {}
}
