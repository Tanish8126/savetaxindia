class EntertainmentAllowance {
  // fully taxable for all employees but deduction is allowed to government employees u/s 16

  // Entertainment allowance received is fully taxable and is first to be included in the
  // salary and thereafter the following deduction is to be made from gross salary.
  // However, deduction in respect of entertainment allowance is available in case of
  // Government employees only. The amount of deduction will be lower of:
  // (i) One-fifth of his basic salary or
  // (ii)  Rs. 5,000 or
  // (iii) Entertainment allowance received.
  // Amount actually spent by the employee towards entertainment out of the
  // entertainment allowance received by him is not a relevant consideration at all.

  int entertainmentAllowanceDeduction({
    required int basicSalary,
    required int entertainmentAllowanceReceived,
  }) {
    int oneFifthOfBasic = (basicSalary / 5).round();
    int maxDeduction = 5000;

    // The deduction is the least of:
    // (i) One-fifth of basic salary
    // (ii) Rs. 5,000
    // (iii) Entertainment allowance received
    return [
      oneFifthOfBasic,
      maxDeduction,
      entertainmentAllowanceReceived,
    ].reduce((a, b) => a < b ? a : b);
  }
}
