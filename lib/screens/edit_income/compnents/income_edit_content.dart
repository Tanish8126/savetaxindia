import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';
import 'editcard.dart';

class IncomeEditContent extends StatelessWidget {
  const IncomeEditContent({super.key, required this.primaryGreen});

  final Color primaryGreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Editable Cards
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              editCard(
                title: "Basic Salary",
                amount: "",
                onEdit: () {},
                onAdd: () {},
                context: context,
              ),
              sh01,
              editCard(
                title: "HRA",
                amount: "12.323",
                onEdit: () {},
                onAdd: () {},
                context: context,
              ),
              sh01,
              editCard(
                title: "HRA",
                amount: "12.323",
                onEdit: () {},
                onAdd: () {},
                context: context,
              ),
              sh01,
              editCard(
                title: "HRA",
                amount: "12.323",
                onEdit: () {},
                onAdd: () {},
                context: context,
              ),
              sh01,
              editCard(
                title: "HRA",
                amount: "12.323",
                onEdit: () {},
                onAdd: () {},
                context: context,
              ),
              sh01,
              editCard(
                title: "HRA",
                amount: "12.323",
                onEdit: () {},
                onAdd: () {},
                context: context,
              ),
              sh01,
              editCard(
                title: "HRA",
                amount: "12.323",
                onEdit: () {},
                onAdd: () {},
                context: context,
              ),
              sh01,
              editCard(
                title: "HRA",
                amount: "12.323",
                onEdit: () {},
                onAdd: () {},
                context: context,
              ),
              sh01,
              editCard(
                title: "HRA",
                amount: "12.323",
                onEdit: () {},
                onAdd: () {},
                context: context,
              ),
              sh01,
              editCard(
                title: "HRA",
                amount: "12.323",
                onEdit: () {},
                onAdd: () {},
                context: context,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
