//================= Received during the period of service ============//
// Fully Taxable

//================ Received on retirement, whether on superannuation or otherwise ================//
//------------ Govt. Employee Fully exempt u/s 10(10AA)(i) -----------------//

//-------------- Other Employee -------------------//
// (i) Leave credit x Avg. salary p.m.
// (ii) 10 months x Avg. salary p.m.
// (iii) Actual amount received
// (iv) Maximum = 25,00,000
// whichever is lower

dynamic cal1(int leavecredit, int avgsalary) {
  int value1 = leavecredit * avgsalary;
  return value1;
}

dynamic cal2(int avgsalary) {
  int value2 = 10 * avgsalary;
  return value2;
}

dynamic cal3(int actsalary) {
  int value3 = actsalary;
  return value3;
}

dynamic cal4() {
  int value4 = 2500000;
  return value4;
}
