import 'package:flutter/material.dart';

class ImageSelection extends StatefulWidget {
  const ImageSelection({super.key});

  @override
  State<ImageSelection> createState() => _ImageSelectionState();
}

class _ImageSelectionState extends State<ImageSelection> {
  List<String> images = [
    "assets/laptop/labtop1.png",
    "assets/laptop/labtop2.png",
    "assets/laptop/labtop3.png",
    "assets/laptop/labtop4.png",
  ];
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfcbf00),

      body: Column(
        children: [
          Image.asset(
            selectedIndex == null
                ? images[0]
                : images[selectedIndex!],
            width: double.infinity,
            height: 450,
          ),
          SizedBox(height: 30),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(images.length, (index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndex = index ;
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                        color: Colors.white,
                      border: Border.all(color: Colors.white,),
                    ),
                    child: Image.asset(images[index],fit: BoxFit.cover,),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
