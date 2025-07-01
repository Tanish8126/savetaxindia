// This file contains functions to calculate income tax as per old and new tax regimes in India.

// Calculates tax as per the old regime rules, considering deductions.
dynamic calculateTaxAsPerOldRules(int income, int deductions) {
  dynamic totalTax = 0; // Total tax to be calculated
  dynamic taxableIncome =
      income - deductions; // Taxable income after deductions

  // Loop through tax slabs until taxable income is below the minimum slab
  while (taxableIncome > 250000) {
    // 30% tax for income above 10 lakhs
    if (taxableIncome > 1000000) {
      var tax = 0.30 * (taxableIncome - 1000000);
      taxableIncome =
          taxableIncome - (taxableIncome - 1000000); // Reduce to next slab
      totalTax += tax;
    }
    // 20% tax for income above 5 lakhs
    if (taxableIncome > 500000) {
      var tax = 0.20 * (taxableIncome - 500000);
      taxableIncome = taxableIncome - (taxableIncome - 500000);
      totalTax += tax;
    }
    // 5% tax for income above 2.5 lakhs
    if (taxableIncome > 250000) {
      var tax = 0.05 * (taxableIncome - 250000);
      taxableIncome = taxableIncome - (taxableIncome - 250000);
      totalTax += tax;
    }
  }
  dynamic x = totalTax;
  return x.round(); // Return rounded tax amount
}

// Updated for FY 2023-24 onwards
// New Regime Slabs:
// 0-3L: 0%, 3-6L: 5%, 6-9L: 10%, 9-12L: 15%, 12-15L: 20%, 15L+: 30%
// Calculates tax as per the new regime rules (no deductions considered)
dynamic calculateTaxAsPerNewRules(int income) {
  dynamic totalTax = 0; // Total tax to be calculated
  var taxableIncome = income; // No deductions in new regime
  // Loop through tax slabs until taxable income is below the minimum slab
  while (taxableIncome > 300000) {
    // 30% tax for income above 15 lakhs
    if (taxableIncome > 1500000) {
      var tax = 0.30 * (taxableIncome - 1500000);
      taxableIncome = taxableIncome - (taxableIncome - 1500000);
      totalTax += tax;
    }
    // 20% tax for income above 12 lakhs
    if (taxableIncome > 1200000) {
      var tax = 0.20 * (taxableIncome - 1200000);
      taxableIncome = taxableIncome - (taxableIncome - 1200000);
      totalTax += tax;
    }
    // 15% tax for income above 9 lakhs
    if (taxableIncome > 900000) {
      var tax = 0.15 * (taxableIncome - 900000);
      taxableIncome = taxableIncome - (taxableIncome - 900000);
      totalTax += tax;
    }
    // 10% tax for income above 6 lakhs
    if (taxableIncome > 600000) {
      var tax = 0.10 * (taxableIncome - 600000);
      taxableIncome = taxableIncome - (taxableIncome - 600000);
      totalTax += tax;
    }
    // 5% tax for income above 3 lakhs
    if (taxableIncome > 300000) {
      var tax = 0.05 * (taxableIncome - 300000);
      taxableIncome = taxableIncome - (taxableIncome - 300000);
      totalTax += tax;
    }
  }
  dynamic x = totalTax;
  return x.round(); // Return rounded tax amount
}
