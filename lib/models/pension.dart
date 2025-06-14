//================ Uncommuted Pension ====================//
//Fully Taxable

//===================== Commuted Pension [Section 10(10A)] ======================//

//------------ Govt. Employee Fully exempt u/s 10(10A)(i) -----------------//

//-------------- Other Employee -------------------//
//receipt of gratuity  exempt u/s 10(10A)(ii)(a)
dynamic caml(int pensionreceived, commutation) {
  (1 / 3 * (pensionreceived / commutation)) * 100;
}

//does not receive any gratuity exempt u/s 10(10A)(ii)(b)
// 1/2 x (commuted pension received ÷ commutation %) x 100

dynamic cal(int pensionreceived, commutation) {
  (1 / 2 * (pensionreceived / commutation)) * 100;
}
