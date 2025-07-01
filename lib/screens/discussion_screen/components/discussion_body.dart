import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/feed_model.dart';
import '../../../providers/user_provider.dart';
import 'tweet_body.dart';

class DiscussionScreenBody extends StatelessWidget {
  const DiscussionScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    //=================User ID from Provider=============//
    final userProvider = Get.put(UserProvider());
    final userId = userProvider.user.uid;

    //=================Gettting Tweets=============//
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('tweets').get(),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (asyncSnapshot.hasError) {
          return Center(child: Text('Error: ${asyncSnapshot.error}'));
        }
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                reverse: false,
                padding: const EdgeInsets.all(12),
                shrinkWrap: true,
                itemCount: asyncSnapshot.data!.docs.length,
                separatorBuilder: (context, index) => const SizedBox(height: 0),
                itemBuilder: (context, index) {
                  final doc = asyncSnapshot.data!.docs[index];
                  final tweetModel = FeedModel.fromMap(doc.data());
                  tweetModel.key = doc.id;
                  return TweetBody(tweetModel: tweetModel, userId: userId);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
