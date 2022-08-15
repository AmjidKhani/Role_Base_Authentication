import 'package:flutter/material.dart';

class navigationbar extends StatefulWidget{
  @override
  _navigationbarState createState() => _navigationbarState();
}

class _navigationbarState extends State<navigationbar> {
  int _currentindex=0;
  final tap=[
    Center(child:Text("Home")),
    Center(child:Text("Search")),
    Center(child:Text("Camera")),
    Center(child:Text("Categories")),

  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(

          appBar: AppBar(title: Text("NavigationBar")

          ),
          body: tap[_currentindex],
          bottomNavigationBar: BottomNavigationBar(
            // iconSize: 50,
            //selectedFontSize: 30,


            //type: BottomNavigationBarType.fixed,      //For Background color fix
            //backgroundColor: Colors.deepOrange,   //For Fix Background colors colors not changed in this properities
            currentIndex:_currentindex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text("home hhh"),
                  //label:"Home",
                  //  label:"Home",
                  backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  title:Text("Search"),
                  // label:"Search",
                  backgroundColor: Colors.red
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.camera_alt),
                  title:Text("Camera"),
                  backgroundColor: Colors.amberAccent
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.comment_outlined),
                  title:Text("Categories"),
                  backgroundColor: Colors.pink
              ),
            ],
            onTap: (index){
              setState(() {
                _currentindex=index;
              });
            },
          ),

        )

    );
  }
}
