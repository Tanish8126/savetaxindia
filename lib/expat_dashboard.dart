import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ExpatFileDashboard extends StatelessWidget {
  const ExpatFileDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors
    const netSalaryColor = Color(0xFFFFA35C);
    const stateTaxesColor = Color(0xFFB97AFF);
    const federalTaxesColor = Color(0xFFFFF36C);
    const deductionsColor = Color(0xFFFF6C8B);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.black87),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://randomuser.me/api/portraits/men/32.jpg",
              ),
              radius: 18,
            ),
          ),
        ],
        title: Row(
          children: [
            // Replace with your logo if needed
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 14,
              child: Text(
                "e",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 6),
            const Text(
              "expatfile",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text(
                "Hello,",
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 2),
              const Text(
                "Justin Valdez",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 18),
              // Chart Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Circular chart
                    SizedBox(
                      height: 160,
                      width: 160,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularPercentIndicator(
                            radius: 70,
                            lineWidth: 18,
                            percent: 1.0,
                            animation: false,
                            circularStrokeCap: CircularStrokeCap.round,
                            backgroundColor: Colors.transparent,
                            progressColor: Colors.transparent,
                            center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "\$7000",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Your Salary",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Custom painted arcs for each segment
                          Positioned.fill(
                            child: CustomPaint(
                              painter: _MultiArcPainter(
                                segments: [
                                  _ArcSegment(0.0, 0.5, netSalaryColor),
                                  _ArcSegment(0.5, 0.7, stateTaxesColor),
                                  _ArcSegment(0.7, 0.85, federalTaxesColor),
                                  _ArcSegment(0.85, 1.0, deductionsColor),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    // Legend
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _legendDot(netSalaryColor, "Net Salary"),
                        const SizedBox(width: 12),
                        _legendDot(stateTaxesColor, "State Taxes"),
                        const SizedBox(width: 12),
                        _legendDot(federalTaxesColor, "Federal Taxes"),
                        const SizedBox(width: 12),
                        _legendDot(deductionsColor, "Deductions"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              // Buttons
              Row(
                children: [
                  Expanded(
                    child: _actionButton(
                      color: Color(0xFFFFA6B6),
                      icon: Icons.assignment,
                      text: "Start 2018 Tax Return",
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _actionButton(
                      color: Color(0xFFB7A6FF),
                      icon: Icons.assignment,
                      text: "Start 2019 Tax Return",
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: _actionButton(
                      color: Color(0xFF7CFFD6),
                      icon: Icons.account_balance,
                      text: "Start FBAR",
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _actionButton(
                      color: Color(0xFFFFFFA6),
                      icon: Icons.timer,
                      text: "File For an Extension",
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _legendDot(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(fontSize: 13, color: Colors.black54)),
      ],
    );
  }

  static Widget _actionButton({
    required Color color,
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          height: 70,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.black87, size: 24),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Helper classes for custom arc painting
class _ArcSegment {
  final double start; // 0.0 to 1.0
  final double end; // 0.0 to 1.0
  final Color color;
  _ArcSegment(this.start, this.end, this.color);
}

class _MultiArcPainter extends CustomPainter {
  final List<_ArcSegment> segments;
  _MultiArcPainter({required this.segments});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final center = rect.center;
    final radius = size.width / 2 - 10;
    final strokeWidth = 18.0;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    for (final seg in segments) {
      paint.color = seg.color;
      final startAngle = -3.14159 / 2 + seg.start * 2 * 3.14159;
      final sweepAngle = (seg.end - seg.start) * 2 * 3.14159;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_MultiArcPainter oldDelegate) => false;
}
