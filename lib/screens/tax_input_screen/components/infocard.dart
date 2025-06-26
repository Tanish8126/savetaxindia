// Helper for info cards
import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';

Widget infoCard({
  required String title,
  required String amount,
  required VoidCallback onEdit,
  required VoidCallback onAdd,
}) {
  return Container(
    decoration: BoxDecoration(
      color: kWhite,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
      ],
    ),
    child: Row(
      children: [
        Expanded(
          child: ListTile(
            title: Text(title, style: tsBW(16, FontWeight.bold)),
            subtitle: Padding(
              padding: pdo(0.007, 0, 0, 0),
              child: Text("₹ $amount", style: tsBW(21, FontWeight.bold)),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.edit, color: Colors.green.shade700),
          onPressed: onEdit,
        ),
        Container(
          margin: const EdgeInsets.only(right: 12),
          child: ElevatedButton(
            onPressed: onAdd,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade700,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: const Size(40, 48),
            ),
            child: const Icon(Icons.add, color: kWhite, size: 28),
          ),
        ),
      ],
    ),
  );
}
