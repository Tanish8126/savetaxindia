import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/constants/constants.dart';

class ReferFriendScreen extends StatelessWidget {
  static const routeName = '/refer_friend_screen';
  final String referralCode;

  const ReferFriendScreen({
    super.key,
    this.referralCode = 'ABC123', // Example code, replace with real logic
  });

  void _copyToClipboard(BuildContext context, String code) {
    Clipboard.setData(ClipboardData(text: code));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Referral code copied!')));
  }

  void _shareReferral(BuildContext context, String code) {
    // Implement share logic, e.g., using share_plus package
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Share functionality coming soon!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Refer a Friend'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            // Illustration/Icon
            Icon(Icons.group_add, size: 80, color: theme.primaryColor),
            const SizedBox(height: 24),
            // Title
            Text(
              'Invite Your Friends!',
              style: tsBW(22, FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            // Description
            Text(
              'Share your referral code and both you and your friend will get exclusive rewards.',
              style: tsCommon(16, kBlack.withValues(alpha: 0.7)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            // Referral code with copy button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: theme.dividerColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(referralCode, style: tsBW(20, FontWeight.bold)),
                  IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () => _copyToClipboard(context, referralCode),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Share button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.share),
                label: const Text('Share Code'),
                onPressed: () => _shareReferral(context, referralCode),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Instructions/Benefits
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'How it works:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 8),
                Text('1. Share your code with friends.'),
                Text('2. They sign up using your code.'),
                Text('3. You both receive rewards!'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
