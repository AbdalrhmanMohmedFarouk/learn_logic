import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UplodeImage extends StatefulWidget {
  const UplodeImage({super.key});

  @override
  State<UplodeImage> createState() => _UplodeImageState();
}

class _UplodeImageState extends State<UplodeImage> {
  XFile? selectedImage;

  Future<void> _uplodeImage() async {
    final pickerImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    print("gallery is open ?");
    setState(() {
      selectedImage = pickerImage;
    });
  }
  void _removeImage(){
    setState(() {
      selectedImage=null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 140),
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(14),
              ),
              child: selectedImage == null
                  ? null
                  : Image.file(File(selectedImage!.path)),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: _uplodeImage,
              child: Container(
                width: 180,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    selectedImage == null ? "Uplode Image" : "Change Image",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            SizedBox(height: 12),
            if(selectedImage !=null)
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
