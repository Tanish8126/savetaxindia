import 'package:flutter/material.dart';

class TaxDashboardScreen extends StatelessWidget {
  const TaxDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors
    const bgGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF3A3A3A), Color(0xFF232323)],
    );
    const yellowCard = Color(0xFFFFD600);
    const blueCard = Color(0xFF00B6FF);
    const redCard = Color(0xFFFF6B6B);

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Container(
          width: 320,
          height: 600,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: bgGradient,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Mohammad Sharifi",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Consultant",
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        "https://randomuser.me/api/portraits/men/32.jpg",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Net Income
                const Center(
                  child: Text(
                    "Net Income",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 6),
                const Center(
                  child: Text(
                    "\$9,349.85",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                // Cards Row
                Row(
                  children: [
                    _infoCard(
                      color: yellowCard,
                      percent: "29%",
                      title: "Tax",
                      amount: "\$1,200.00",
                      icon: Icons.monetization_on,
                      barColor: yellowCard,
                    ),
                    const SizedBox(width: 12),
                    _infoCard(
                      color: blueCard,
                      percent: "87%",
                      title: "Income",
                      amount: "\$32,000.00",
                      icon: Icons.savings,
                      barColor: blueCard,
                    ),
                    const SizedBox(width: 12),
                    _infoCard(
                      color: redCard,
                      percent: "23%",
                      title: "Exp.",
                      amount: "\$3,200.00",
                      icon: Icons.trending_down,
                      barColor: redCard,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Tax summary and Yearly
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Tax summery",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Yearly",
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Amount and percent
                Row(
                  children: const [
                    Text(
                      "\$9,349.85",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "49.98%",
                      style: TextStyle(
                        color: Color(0xFF4FFF8A),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Icon(
                      Icons.arrow_upward,
                      color: Color(0xFF4FFF8A),
                      size: 16,
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                // Bar Chart
                _barChart(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _infoCard({
    required Color color,
    required String percent,
    required String title,
    required String amount,
    required IconData icon,
    required Color barColor,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white, size: 18),
                const Spacer(),
                Text(
                  percent,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              amount,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 8),
            // Mini bar chart
            Row(
              children: List.generate(
                4,
                (i) => Container(
                  margin: const EdgeInsets.only(right: 3),
                  width: 7,
                  height: 10.0 + (i * 3),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha((255 * 0.7).toInt()),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _barChart() {
    // Example data for each month
    final List<double> values = [0.4, 0.6, 0.5, 0.8, 0.7, 1.0, 0.8];
    final List<Color> barColors = [
      Colors.white54,
      Colors.white54,
      Colors.white54,
      Colors.white,
      Colors.white,
      Color(0xFFFFD600),
      Colors.white54,
    ];
    final List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
    ];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(values.length, (i) {
        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: 70 * values[i],
                decoration: BoxDecoration(
                  color: barColors[i],
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                months[i],
                style: TextStyle(
                  color: Colors.white.withAlpha((255 * 0.7).toInt()),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
