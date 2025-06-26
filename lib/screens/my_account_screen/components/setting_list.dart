import 'package:flutter/material.dart';

import '../../notification_screen/notification_screen.dart';
import '../../tree.my_account/change_language/change_language.dart';
import '../../tree.my_account/close_account_screen/close_account_screen.dart';
import '../../tree.my_account/refer_friend_screen/refer_friend_screen.dart';
import '../../upload_file_screen/upload_file_screen.dart';

final settings = [
  {
    'icon': Icons.assignment_turned_in_outlined,
    'title': 'Prefilled tax return',
    'subtitle': null,
  },
  {
    'icon': Icons.insert_drive_file_outlined,
    'title': 'Documents',
    'subtitle': 'New: Upload documents here',
    'route': UploadFileScreen.routeName,
  },
  {
    'icon': Icons.group_add_outlined,
    'title': 'Refer a friend',
    'subtitle': null,
    'route': ReferFriendScreen.routeName,
  },
  {
    'icon': Icons.notifications_outlined,
    'title': 'Notification Settings',
    'subtitle': null,
    'route': NotificationScreen.routeName,
  },
  {'icon': Icons.lock_outline, 'title': 'Change PIN', 'subtitle': null},
  {
    'icon': Icons.email_outlined,
    'title': 'Change email address',
    'subtitle': null,
  },
  {
    'icon': Icons.privacy_tip_outlined,
    'title': 'Privacy settings',
    'subtitle': null,
  },
  {
    'icon': Icons.language_outlined,
    'title': 'Change language',
    'subtitle': null,
    'route': ChangeLanguageScreen.routeName,
  },
  {
    'icon': Icons.delete_outline,
    'title': 'Close account',
    'subtitle': null,
    'route': CloseAccountScreen.routeName,
  },
];
