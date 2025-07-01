import 'package:flutter/material.dart';

import 'components/create_tweet_body.dart';

class CreateTweetScreen extends StatelessWidget {
  static String routeName = './create_tweet_screen';
  const CreateTweetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Create Tweet')),
        body: CreateTweetScreenBody(),
      ),
    );
  }
}
