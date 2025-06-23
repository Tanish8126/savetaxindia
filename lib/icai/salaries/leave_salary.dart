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

int calculateLeaveSalaryExemption({
  required int leaveCredit,
  required int avgSalaryPerMonth,
  required int actualAmountReceived,
}) {
  int amount1 = leaveCredit * avgSalaryPerMonth;
  int amount2 = 10 * avgSalaryPerMonth;
  int amount3 = actualAmountReceived;
  int amount4 = 2500000; // Maximum limit

  // Return the minimum of the four amounts
  return [amount1, amount2, amount3, amount4].reduce((a, b) => a < b ? a : b);
}
