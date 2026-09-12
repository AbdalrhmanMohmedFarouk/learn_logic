import 'package:flutter/material.dart';

class MultiSelection extends StatefulWidget {
  const MultiSelection({super.key});

  @override
  State<MultiSelection> createState() => _MultiSelectionState();
}

class _MultiSelectionState extends State<MultiSelection> {
  List<Map<String, String>> gifts = [
    {"name": "cow", "image": "assets/animals/cow.png"},
    {"name": "deer", "image": "assets/animals/deer.png"},
    {"name": "giraffe", "image": "assets/animals/giraffe.png"},
    {"name": "lion", "image": "assets/animals/lion.png"},
    {"name": "pigeon", "image": "assets/animals/pingeon.png"},
    {"name": "rat", "image": "assets/animals/rat.png"},
    {"name": "tiger", "image": "assets/animals/tiger.png"},
    {"name": "white-tiger", "image": "assets/animals/white-tiger.png"},
  ];
  int? selectedIndex ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 40,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex = index ;
                });
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black12, Colors.black54,Colors.black87],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Image.asset(gifts[index]["image"].toString()),
                      SizedBox(height: 5),
                      Text(
                        gifts[index]["name"].toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                 selectedIndex==index ? Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "Send",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ):SizedBox.shrink(),
                ],
              ),
            );
          },
          itemCount: gifts.length,
        ),
      ),
    );
  }
}
