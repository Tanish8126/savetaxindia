// fully taxable for all employees but deduction is allowed to government employees u/s 16

import 'package:flutter/material.dart';
import 'package:savetaxindia/icai/employment_type.dart';

dynamic ent(int amt, String status, dynamic salaried) {
  String value = employment(salaried);
  if (status == employment(salaried)) {
    Text("Only 5000 is allowed");
  } else {
    if (amt > 5000) {
    } else {
      20 % amt;
    }
  }
}
