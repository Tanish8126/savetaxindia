import 'package:flutter/material.dart';

import 'income_tax_sections.dart';

class IncomeTaxAct extends StatelessWidget {
  const IncomeTaxAct({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: incomeTaxSections.length,
        itemBuilder: (context, index) {
          final section = incomeTaxSections[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: ListTile(
              title: Text(section["section"] ?? ""),
              subtitle: Text(section["title"] ?? ""),
              onTap: () {
                // You can add navigation to section details here
              },
            ),
          );
        },
      ),
    );
  }
}
