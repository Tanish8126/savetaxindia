class Gratuity {
  //================== Received during service =================//
  //Fully Taxable

  //===================== Received at the time of retirement/Death =====================//

  //------------ Govt. Employee Fully exempt u/s 10(10)(i) -----------------//

  //-------------- Other Employee -------------------//
  // Covered under the Payment of Gratuity Act, 1972

  // Not covered under the Payment of Gratuity Act, 1972

  double gratuityExemption({
    required double gratuityReceived,
    required bool
    isGovtEmployee, // true for Central Govt/Civil Services/Local Authority
    required bool
    isCoveredUnderGratuityAct, // true if covered by Payment of Gratuity Act, 1972
    required double lastDrawnSalary, // required if covered by Gratuity Act
    int? yearsOfService, // required for both
    double? avgSalaryLast10Months, // required if NOT covered by Gratuity Act
  }) {
    const double maxExemption = 2000000;

    if (isGovtEmployee) {
      // Fully exempt for Govt employees
      return gratuityReceived;
    }

    if (isCoveredUnderGratuityAct) {
      // For employees covered by Payment of Gratuity Act, 1972
      if (yearsOfService == null) return 0;
      // If service is more than 6 months, round up the year
      int years = yearsOfService;
      double gratuityLimit = (15 / 26) * lastDrawnSalary * years;
      return [
        gratuityReceived,
        gratuityLimit,
        maxExemption,
      ].reduce((a, b) => a < b ? a : b);
    } else {
      // For employees NOT covered by Payment of Gratuity Act, 1972
      if (avgSalaryLast10Months == null || yearsOfService == null) return 0;
      int years = yearsOfService;
      double gratuityLimit = 0.5 * avgSalaryLast10Months * years;
      return [
        gratuityReceived,
        gratuityLimit,
        maxExemption,
      ].reduce((a, b) => a < b ? a : b);
    }
  }
}
