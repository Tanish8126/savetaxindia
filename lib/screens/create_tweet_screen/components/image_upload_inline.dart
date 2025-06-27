// Inline image upload widget for tweet creation
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ImageUploadInline extends StatefulWidget {
  final void Function(Uint8List?) onImageSelected;
  final Uint8List? image;
  const ImageUploadInline({
    super.key,
    required this.onImageSelected,
    this.image,
  });

  @override
  State<ImageUploadInline> createState() => _ImageUploadInlineState();
}

class _ImageUploadInlineState extends State<ImageUploadInline> {
  Uint8List? _image;

  @override
  void initState() {
    super.initState();
    _image = widget.image;
  }

  Future<void> _pickImage() async {
    FilePickerResult? pickedImage = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (pickedImage != null) {
      final bytes = await File(pickedImage.files.single.path!).readAsBytes();
      setState(() {
        _image = bytes;
      });
      widget.onImageSelected(bytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_image != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.memory(
              _image!,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
        TextButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.image),
          label: const Text('Upload Image'),
        ),
      ],
    );
  }
}
