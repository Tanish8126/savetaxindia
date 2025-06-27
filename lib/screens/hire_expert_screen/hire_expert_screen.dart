import 'package:flutter/material.dart';

import 'components/hire_expert_body.dart';

class HireExpertScreen extends StatelessWidget {
  static String routeName = './hire_expert_screen.dart';
  const HireExpertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> experts = [
      {
        'icon': Icons.account_balance,
        'name': 'Chartered Accountant',
        'desc': 'Expert in tax filing, audit, and compliance.',
      },
      {
        'icon': Icons.gavel,
        'name': 'Tax Lawyer',
        'desc': 'Legal advice for tax disputes and notices.',
      },
      {
        'icon': Icons.person,
        'name': 'Tax Consultant',
        'desc': 'Guidance on tax planning and savings.',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Hire Tax Expert"), centerTitle: true),
      body: HireExpertBody(experts: experts),
    );
  }
}
