dynamic calculateTaxAsPerOldRules(int income, int deductions) {
  dynamic totalTax = 0;
  dynamic taxableIncome = income - deductions;

  while (taxableIncome > 250000) {
    // 30%
    if (taxableIncome > 1000000) {
      var tax = 0.30 * (taxableIncome - 1000000);
      taxableIncome = taxableIncome - (taxableIncome - 1000000);
      totalTax += tax;
    }
    if (taxableIncome > 500000) {
      var tax = 0.20 * (taxableIncome - 500000);
      taxableIncome = taxableIncome - (taxableIncome - 500000);
      totalTax += tax;
    }

    if (taxableIncome > 250000) {
      var tax = 0.05 * (taxableIncome - 250000);
      taxableIncome = taxableIncome - (taxableIncome - 250000);
      totalTax += tax;
    }
  }
  dynamic x = totalTax;
  return x.round();
}

// Updated for FY 2023-24 onwards
// New Regime Slabs:
// 0-3L: 0%, 3-6L: 5%, 6-9L: 10%, 9-12L: 15%, 12-15L: 20%, 15L+: 30%
dynamic calculateTaxAsPerNewRules(int income) {
  dynamic totalTax = 0;
  var taxableIncome = income;
  while (taxableIncome > 300000) {
    if (taxableIncome > 1500000) {
      var tax = 0.30 * (taxableIncome - 1500000);
      taxableIncome = taxableIncome - (taxableIncome - 1500000);
      totalTax += tax;
    }
    if (taxableIncome > 1200000) {
      var tax = 0.20 * (taxableIncome - 1200000);
      taxableIncome = taxableIncome - (taxableIncome - 1200000);
      totalTax += tax;
    }
    if (taxableIncome > 900000) {
      var tax = 0.15 * (taxableIncome - 900000);
      taxableIncome = taxableIncome - (taxableIncome - 900000);
      totalTax += tax;
    }
    if (taxableIncome > 600000) {
      var tax = 0.10 * (taxableIncome - 600000);
      taxableIncome = taxableIncome - (taxableIncome - 600000);
      totalTax += tax;
    }
    if (taxableIncome > 300000) {
      var tax = 0.05 * (taxableIncome - 300000);
      taxableIncome = taxableIncome - (taxableIncome - 300000);
      totalTax += tax;
    }
  }
  dynamic x = totalTax;
  return x.round();
}
