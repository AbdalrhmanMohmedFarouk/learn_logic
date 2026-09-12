import 'package:flutter/material.dart';
import 'package:simple_logic/screens/multi_image_selection.dart';
import 'package:simple_logic/screens/multi_selection.dart';
import 'package:simple_logic/screens/toggle_selection.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final PageController controller = PageController();
  final List<Widget> _screens = [
    MultiSelection(),
    MultiImageSelection(),
    ToggleSelection(),
  ];
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: PageView(
        controller: controller,
        children:_screens,
        onPageChanged: (v) {
          setState(() {
            selectedIndex = v;

          });
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Row(
          mainAxisAlignment: .center,
          children: [
            //back
            GestureDetector(
              onTap: (){
                setState(() {
                  controller.jumpToPage(selectedIndex-1);
                });
              },
              child: Container(
                // width: 200,
                height: 50,
                decoration: BoxDecoration(
                    border:Border.all(color: Colors.black) ,
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 17.0),
                  child: Row(
                    mainAxisAlignment: .center,
                    children: [
                      SizedBox(width: 5,),
                      Icon(Icons.arrow_back,color: Colors.black,),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 10,),
            //forward
            GestureDetector(
              onTap: (){
                setState(() {
                 controller.jumpToPage(selectedIndex+1) ;
                });
              },
              child: Container(
                // width: 200,
                height: 50,
                decoration: BoxDecoration(color: Colors.black),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        "Go to Next Page",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 5,),
                      Icon(Icons.arrow_forward,color: Colors.white,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.eighteen_mp),
      //       label: "MultiSelection",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.eighteen_mp),
      //       label: "MultiImageSelection",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.eighteen_mp),
      //       label: "ToggleSelection",
      //     ),
      //   ],
      // ),
    );
  }
}
