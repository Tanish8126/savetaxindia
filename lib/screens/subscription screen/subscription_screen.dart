import 'package:flutter/material.dart';
import 'package:savetaxindia/utils/constants/constants.dart';

import 'components/plan_card.dart';
import 'components/plan_list.dart';

class SubscriptionScreen extends StatelessWidget {
  static String routeName = "/subscription_screen";
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        title: const Text('Subscription'),
        centerTitle: true,
        backgroundColor: kPrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Current plan section (placeholder)
            Card(
              color: Colors.green.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Icon(Icons.verified, color: Colors.green.shade700),
                title: Text(
                  'Current Plan: Free',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Upgrade to unlock more features!'),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Choose Your Plan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...plans.map((plan) => PlanCard(plan: plan)),
          ],
        ),
      ),
    );
  }
}
