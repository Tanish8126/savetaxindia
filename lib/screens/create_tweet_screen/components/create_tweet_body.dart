import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/post_data_methods.dart';
import '../../../utils/constants/constants.dart';
import 'image_upload_inline.dart';

class CreateTweetScreenBody extends StatefulWidget {
  const CreateTweetScreenBody({super.key});

  @override
  State<CreateTweetScreenBody> createState() => _CreateTweetScreenBodyState();
}

class _CreateTweetScreenBodyState extends State<CreateTweetScreenBody> {
  final PostDataMethods _postDataMethods = Get.put(PostDataMethods());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _tweetController = TextEditingController();
  bool _isLoading = false;
  Uint8List? _image;

  void _onImageSelected(Uint8List? image) {
    setState(() {
      _image = image;
    });
  }

  void _submit(BuildContext context) async {
    if (_tweetController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Tweet cannot be empty!')));
      return;
    }
    setState(() => _isLoading = true);
    await _postDataMethods.saveTweet(context, _tweetController.text);
    setState(() => _isLoading = false);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: pda(0.03),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title', style: tsBW(18, FontWeight.bold)),
            TextFormField(
              controller: _titleController,
              style: tsB(16),
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                hintText: 'Enter your title here (if any)',
                hintStyle: tsB(16),
                focusedBorder: oi15(const Color(0xff343434)),
                enabledBorder: oi15(const Color(0xff343434)),
              ),
            ),
            sh03,
            Text('Tweet', style: tsBW(18, FontWeight.bold)),
            TextFormField(
              controller: _tweetController,
              textAlign: TextAlign.left,
              style: tsB(16),
              textCapitalization: TextCapitalization.sentences,
              maxLength: 250,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: "What's on your mind?",
                hintStyle: tsB(16),
              ),
            ),
            sh03,
            Text('Attach Image', style: tsBW(18, FontWeight.bold)),
            ImageUploadInline(onImageSelected: _onImageSelected, image: _image),
            sh03,
            if (_isLoading) Center(child: CircularProgressIndicator()),
            if (!_isLoading)
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      child: const Text('Cancel'),
                    ),
                  ),
                  sw03,
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _submit(context),
                      child: const Text('Post'),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
