import 'dart:io';
import 'dart:typed_data';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/constants/constants.dart';
import 'url_launcher.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({super.key});

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  Uint8List? image;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        dashPattern: [8, 4],
        strokeWidth: 1.5,
        radius: Radius.circular(16),
        color: kGrey,
      ),
      child: Container(
        padding: pda(0.02),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.memory(image!, fit: BoxFit.fill),
                    )
                  : Image.asset('assets/images/lock.png', height: 80),
            ),

            //Replace with your asset
            sh02,
            Text('Save your first document for 2025 here', style: tsB(16)),
            sh02,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kGreen,
                  foregroundColor: kBlack,
                  padding: pds(0, 0.03),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => bottomsheet(),
                  );
                },
                icon: Icon(Icons.add, color: kBlack),
                label: Text('Upload Image', style: tsBW(18, FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomsheet() {
    return SizedBox(
      height: SizeConfig.screenHeight * 0.35,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sh02,
            TextButton.icon(
              icon: const Icon(Icons.camera_alt_outlined),
              label: const Text("Scan with Camera"),
              style: TextButton.styleFrom(
                foregroundColor: kBlack.withValues(alpha: 0.7),
              ),
              onPressed: () {
                takephoto(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
            TextButton.icon(
              icon: const Icon(Icons.image),
              label: const Text("Upload from Gallery"),
              style: TextButton.styleFrom(
                foregroundColor: kBlack.withValues(alpha: 0.7),
              ),
              onPressed: () {
                takephoto(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
            TextButton.icon(
              icon: const Icon(Icons.document_scanner),
              label: const Text("Upload File"),
              style: TextButton.styleFrom(
                foregroundColor: kBlack.withValues(alpha: 0.7),
              ),
              onPressed: () {
                takephoto(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),

            // Url Launcher
            UrlLauncher(),
          ],
        ),
      ),
    );
  }

  void takephoto(ImageSource source) async {
    Uint8List? pickedFile = await pickImage();
    setState(() {
      if (pickedFile != null) {
        image = pickedFile;
      }
    });
  }

  Future<Uint8List?> pickImage() async {
    FilePickerResult? pickedImage = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (pickedImage != null) {
      setState(() {});
      return await File(pickedImage.files.single.path!).readAsBytes();
    }
    return null;
  }
}
