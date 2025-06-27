import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:typed_data';

import '../models/feed_model.dart';
import '../models/phone_data_model.dart';
import '../providers/user_provider.dart';
import '../utils/constants/constants.dart';
import '../utils/snackbar.dart';

class PostDataMethods {
  final _userRef = FirebaseFirestore.instance;
  final UserProvider _userProvider = Get.put(UserProvider());

  //================USER RELATED=============//

  //Save Mobile Number to Firebase
  Future<void> postMobileData(
    String uid,
    String phoneNo,
    DateTime creation,
  ) async {
    Phonedata userdata = Phonedata(
      uid: uid,
      phoneNumber: phoneNo,
      creationDate: creation,
    );
    await _userRef.collection('userData').doc(uid).set(userdata.toMap());
  }

  //================TWEET RELATED=============//

  //Save Tweet to Firebase

  Future<String> saveTweet(
    BuildContext context,
    String tweet, {
    String? title,
    Uint8List? image,
  }) async {
    String channelId = '';
    String? imageUrl;
    try {
      if (image != null) {
        // Upload image to Firebase Storage
        final storageRef = FirebaseStorage.instance.ref();
        final fileName =
            'tweet_images/${DateTime.now().millisecondsSinceEpoch}.png';
        final uploadTask = await storageRef.child(fileName).putData(image);
        imageUrl = await uploadTask.ref.getDownloadURL();
      }
      FeedModel feedModel = FeedModel(
        userId: _userProvider.user.uid,
        createdAt: DateTime.now(),
        description: tweet,
        imagePath: imageUrl,
        // Add title if you add it to FeedModel
      );
      _userRef.collection('tweets').doc().set(feedModel.toMap());
    } on FirebaseException catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.message!);
      } else {
        Get.snackbar(
          'Error',
          e.message!,
          backgroundColor: kBlack,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
    return channelId;
  }

  //Add Like To Tweet
  Future<void> addLikeToTweet(FeedModel tweet, String userId) async {
    final tweetDoc = FirebaseFirestore.instance
        .collection('tweets')
        .doc(tweet.key);
    final likeDoc = tweetDoc.collection('likeList').doc(userId);
    final likeSnapshot = await likeDoc.get();
    if (likeSnapshot.exists) {
      // Unlike: remove like
      await likeDoc.delete();
      await tweetDoc.update({
        'likeCount': FieldValue.increment(-1),
        'likeList': FieldValue.arrayRemove([userId]),
      });
    } else {
      // Like: add like
      await likeDoc.set({'userId': userId, 'likedAt': DateTime.now()});
      await tweetDoc.update({
        'likeCount': FieldValue.increment(1),
        'likeList': FieldValue.arrayUnion([userId]),
      });
    }
  }

  //Add Bookmark to Tweet
  void addBookmark(FeedModel tweet, String userId) async {
    FirebaseFirestore.instance
        .collection('tweet')
        .doc(tweet.key!)
        .collection('bookmarks')
        .doc(userId)
        .set({'userId': userId, 'bookmarkedAt': DateTime.now()});
  }

  //Add Comment to Tweet
  void commentToTweet(FeedModel tweet, String userId) async {
    FirebaseFirestore.instance
        .collection('tweet')
        .doc(tweet.key!)
        .collection('comments')
        .doc()
        .set({
          'userId': userId,
          'comment': '', // You may want to pass the comment text as a parameter
          'createdAt': DateTime.now(),
        });
  }
}
