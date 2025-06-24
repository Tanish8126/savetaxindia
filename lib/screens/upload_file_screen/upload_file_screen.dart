import 'package:flutter/material.dart';

import 'components/body.dart';

class UploadFileScreen extends StatelessWidget {
  static String routeName = '/upload_file_screen';
  const UploadFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body());
  }
}
