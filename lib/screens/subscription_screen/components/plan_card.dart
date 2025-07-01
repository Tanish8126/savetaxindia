import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';

class PlanCard extends StatelessWidget {
  final Map<String, dynamic> plan;
  const PlanCard({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    final highlight = plan['highlight'] == true;
    return Card(
      elevation: highlight ? 6 : 2,
      color: highlight ? Colors.orange.shade50 : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  plan['name'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kBlack,
                  ),
                ),
                if (highlight)
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Popular',
                      style: TextStyle(color: kBlack, fontSize: 12),
                    ),
                  ),
                Spacer(),
                Text(
                  plan['price'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...List<Widget>.from(
              plan['features'].map<Widget>(
                (f) => Row(
                  children: [
                    Icon(Icons.check, color: Colors.green, size: 18),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        f,
                        style: TextStyle(fontSize: 15, color: kBlack),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: highlight
                      ? Colors.orange
                      : Colors.green.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Text('Subscribe'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
