import 'package:flutter/material.dart';

import 'constants.dart';

//BoxDecoration
var bdPT = const BoxDecoration(
  color: kPrimary,
  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(40), topRight: Radius.circular(40)),
);

var cartdec = BoxDecoration(
    color: const Color.fromARGB(255, 255, 255, 255).withValues(alpha: 0.1),
    borderRadius: const BorderRadius.all(Radius.circular(10)));

BoxDecoration bdCircular(Color color, double size) {
  return BoxDecoration(
    border: Border.all(color: color),
    borderRadius: BorderRadius.circular(size),
  );
}

BoxDecoration bdAll(Color color, double size) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(size),
  );
}

//OutlineInputBorder
OutlineInputBorder oi15(Color color) {
  return OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(getProportionateScreenHeight(15))),
      borderSide: BorderSide(color: color));
}
