import 'package:flutter/material.dart';

import '../../utils/constants/constants.dart';

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
      body: Padding(
        padding: pds(0.02, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sh01,
            const Text(
              "Choose an expert to help you with your tax needs. Our professionals are verified and experienced.",
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
            sh02,
            Expanded(
              child: ListView.separated(
                itemCount: experts.length,
                separatorBuilder: (context, index) => sh01,
                itemBuilder: (context, index) {
                  final expert = experts[index];
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Padding(
                      padding: pda(0.03),
                      child: Row(
                        children: [
                          Icon(
                            expert['icon'],
                            size: 40,
                            color: Colors.green.shade700,
                          ),
                          sw02,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  expert['name'],
                                  style: tsBW(18, FontWeight.bold),
                                ),
                                sh01,
                                Text(expert['desc'], style: tsB(14)),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green.shade600,
                              foregroundColor: kWhite,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text('Hire'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
