import 'package:flutter/material.dart';

class TaxSavingCard extends StatelessWidget {
  const TaxSavingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: const EdgeInsets.all(18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.volunteer_activism_outlined,
            size: 32,
            color: Colors.black54,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Donations',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'For money you donated to a good cause. Including membership fees.',
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFE6EFFF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'High impact',
                    style: TextStyle(
                      color: Color(0xFF3A5A40),
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: Color(0xFFB6E388).withValues(alpha: 0.3),
            child: Icon(Icons.add, color: Color(0xFF3A5A40)),
          ),
        ],
      ),
    );
  }
}
