import 'package:flutter/material.dart';
import 'package:savetaxindia/utils/constants/constants.dart';

class TaxDashboardScreen extends StatelessWidget {
  static String routeName = './tax_dashboard.dart';
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
      body: Container(
        decoration: BoxDecoration(gradient: bgGradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 34),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              sh01,
              // Profile Row
              ProfileRow(),
              const SizedBox(height: 32),
              // Net Income
              NetIncome(),

              //   const SizedBox(height: 6),
              const SizedBox(height: 28),
              // Cards Row
              Row(
                children: [
                  _infoCard(
                    color: yellowCard,
                    percent: "29%",
                    title: "Tax",
                    amount: "₹1,20,000",
                    icon: Icons.monetization_on,
                    barColor: yellowCard,
                  ),
                  const SizedBox(width: 12),
                  _infoCard(
                    color: blueCard,
                    percent: "87%",
                    title: "Income",
                    amount: "₹ 32,000",
                    icon: Icons.savings,
                    barColor: blueCard,
                  ),
                  const SizedBox(width: 12),
                  _infoCard(
                    color: redCard,
                    percent: "23%",
                    title: "Exp.",
                    amount: "₹3,200",
                    icon: Icons.trending_down,
                    barColor: redCard,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Tax summary and Yearly
              TaxSummary(),

              // Amount and percent
              const SizedBox(height: 18),
              // Bar Chart
              _barChart(),
            ],
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
              Padding(
                padding: pds(0.007, 0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: 200 * values[i],
                  decoration: BoxDecoration(
                    color: barColors[i],
                    borderRadius: BorderRadius.circular(6),
                  ),
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

class TaxSummary extends StatelessWidget {
  const TaxSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Text("Yearly", style: TextStyle(color: Colors.white70, fontSize: 15)),
      ],
    );
  }
}

class NetIncome extends StatelessWidget {
  const NetIncome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Net Income",
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          Text(
            "₹9,34,985",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileRow extends StatelessWidget {
  const ProfileRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
