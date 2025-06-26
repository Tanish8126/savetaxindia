import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/constants.dart';
import 'setting_list.dart';
import 'support_section.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //================Top section=================
      child: ListView(
        padding: pda(0.03),
        children: [
          sh01,
          Text('My account', style: tsBW(28, FontWeight.bold)),
          sh01,
          Text('tanishpurwar30@gmail.com', style: tsBW(16, FontWeight.w500)),
          sh02,
          Text('Account settings', style: tsBW(20, FontWeight.bold)),
          sh01,

          //================Settings section=================
          ...settings.map((item) {
            return Column(
              children: [
                ListTile(
                  leading: Icon(item['icon'] as IconData, color: kBlack),
                  title: Text(
                    item['title'] as String,
                    style: tsBW(18, FontWeight.w500),
                  ),
                  //================Subtitle=================
                  //For some settings, we have a subtitle
                  subtitle: item['subtitle'] != null
                      ? Text(
                          item['subtitle'] as String,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : null,
                  trailing: Icon(
                    Icons.chevron_right,
                    color: kBlack.withValues(alpha: 0.4),
                  ),
                  onTap: () {
                    if (item['route'] != null) {
                      Get.toNamed(item['route'] as String);
                    }
                  },
                ),
                const Divider(height: 1, thickness: 0.7),
              ],
            );
          }),
          sh02,

          //==================Support section==================
          const SupportSection(),
        ],
      ),
    );
  }
}
