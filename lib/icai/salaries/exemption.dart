//=============HRA=============//

// Least of the following is exempt:
// (a) HRA actually received
// (b) Rent paid less 10% of salary
// (c) 50% of salary, if accommodation is located
// in Mumbai, Kolkata, Delhi or Chennai
// 40% of salary, if the accommodation is
// located in any other city.
// Note - Exemption would be available to an
// assessee only if he exercises the option of shifting
// out of the default tax regime provided under section 115BAC(1A)

double hraExemption({
  required double hraReceived,
  required double rentPaid,
  required double salary,
  required bool isMetro, // true for Mumbai, Kolkata, Delhi, Chennai
  required bool optedOutOf115BAC, // true if opted out of new regime
}) {
  if (!optedOutOf115BAC) {
    // No exemption under default tax regime (115BAC)
    return 0.0;
  }

  double rentMinus10PercentSalary = rentPaid - (0.10 * salary);
  double percentOfSalary = isMetro ? 0.50 * salary : 0.40 * salary;

  // Calculate all three values
  double a = hraReceived;
  double b = rentMinus10PercentSalary > 0 ? rentMinus10PercentSalary : 0;
  double c = percentOfSalary;

  // Return the minimum of the three
  return [
    a,
    b,
    c,
  ].reduce((value, element) => value < element ? value : element);
}

//=============Children Education Allowance=============//

// 100 per month per child upto maximum of two children
// Note - Exemption would be available to an
// assessee only if he exercises the option of shifting
// out of the default tax regime provided under
// section 115BAC(1A)

int childrenEducationAllowanceExemption({
  required int numberOfChildren,
  required int months,
  required bool optedOutOf115BAC, // true if opted out of new regime
}) {
  if (!optedOutOf115BAC) {
    // No exemption under default tax regime (115BAC)
    return 0;
  }
  int eligibleChildren = numberOfChildren > 2 ? 2 : numberOfChildren;
  return eligibleChildren * months * 100;
}

//=============Transport Allowance=============//

// 3,200 per month for an employee who is blind
// or deaf and dumb or orthopedically handicapped
// Note - Exemption in respect of transport
// allowance would be available to an assessee
// irrespective of the regime under which he pays
// tax

int transportAllowanceExemption({
  required int months,
  required bool
  isHandicapped, // true if employee is blind, deaf & dumb, or orthopedically handicapped
}) {
  if (!isHandicapped) {
    return 0;
  }
  return 3200 * months;
}

//=============Hostel Expenditure Allowance=============//

// 300 per month for an employee who is staying in a hostel
// Note - Exemption in respect of hostel expenditure
// allowance would be available to an assessee
// irrespective of the regime under which he pays
// tax

int hostelExpenditureAllowanceExemption({
  required int numberOfChildren,
  required int months,
  required bool optedOutOf115BAC, // true if opted out of new regime
}) {
  if (!optedOutOf115BAC) {
    // No exemption under default tax regime (115BAC)
    return 0;
  }
  int eligibleChildren = numberOfChildren > 2 ? 2 : numberOfChildren;
  return eligibleChildren * months * 300;
}
