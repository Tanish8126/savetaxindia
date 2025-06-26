import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';

class SupportSection extends StatelessWidget {
  const SupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Support', style: tsBW(20, FontWeight.bold)),
        sh01,
        ListTile(
          leading: Icon(Icons.help_outline, color: kBlack),
          title: Text('Get help', style: tsBW(16, FontWeight.w500)),
          trailing: Icon(Icons.chevron_right, color: Colors.black45),
          onTap: () {
            // Handle get help
          },
        ),
        Divider(height: 1, thickness: 0.7),
        sh02,
        // Footer links
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 24,
          runSpacing: 8,
          children: [
            Text(
              'Terms and conditions',
              style: tsCommon(14, kBlack.withValues(alpha: 0.6)),
            ),
            Text(
              'Privacy policy',
              style: tsCommon(14, kBlack.withValues(alpha: 0.6)),
            ),
            Text(
              'Cancellation policy',
              style: tsCommon(14, kBlack.withValues(alpha: 0.6)),
            ),
            Text('Imprint', style: tsCommon(14, kBlack.withValues(alpha: 0.6))),
            Text(
              'Open Source',
              style: tsCommon(14, kBlack.withValues(alpha: 0.6)),
            ),
          ],
        ),
        sh02,
        Center(
          child: Text(
            '© Save Tax India',
            style: tsCommon(16, kBlack.withValues(alpha: 0.3)),
          ),
        ),
      ],
    );
  }
}
