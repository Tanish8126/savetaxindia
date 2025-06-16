import 'package:flutter/material.dart';

// Leave Travel Concession
dynamic leave() {}

// Medical Facility
dynamic medical() {}

//Loan
dynamic loan(int amt, sbi, actual) {
  //if tacken for specified disease not taxable
  if (amt > 20000) {
    dynamic value1 = amt * (sbi - actual);
  } else {
    Text("Not Taxable");
  }
}

//Gift from ER
dynamic gift() {}

//ESOP
dynamic esop(int fmv, issueprice) {
  dynamic valie2 = fmv - issueprice;
}

//Use of Movable Asset

//Transfer of Movable Assets

//Lunch
dynamic lunch(int price) {
  var value1 = price - 50;
}

//Employer contribution towards RPF, ASF & NPS [Sec 17(2)(vii)]

//Motor car facility
dynamic motor() {}
