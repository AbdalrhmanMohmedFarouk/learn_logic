import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UplodeMultiImages extends StatefulWidget {
  const UplodeMultiImages({super.key});

  @override
  State<UplodeMultiImages> createState() => _UplodeMultiImagesState();
}

class _UplodeMultiImagesState extends State<UplodeMultiImages> {
  List<XFile?> selectedImages = [null, null, null];

  Future<void> _uplodeImages() async {
    final List<XFile> pickedImages = await ImagePicker().pickMultiImage(
      limit: 3,
    );

    for (int i = 0; i < 3; i++) {
      selectedImages[i] = i < pickedImages.length ? pickedImages[i] : null;
    }

    setState(() {});
  }

  Future<void> _removeImage() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade900,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 140),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(selectedImages.length, (index) {
                  final images = selectedImages[index];
                  return Container(
                    width: 180,
                    height: 180,
                    margin: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: images == null
                        ? null
                        : Image.file(File(images.path)),
                  );
                }),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: _uplodeImages,
              child: Container(
                width: 180,
                height: 40,

                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    // selectedImages == null ?
                    "Uplode Image",
                    // : "Change Image"
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            SizedBox(height: 12),
            // if(selectedImages!=null)
            GestureDetector(
              onTap: _removeImage,
              child: Container(
                width: 180,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    "Remove Image",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
