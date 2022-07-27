import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class admindashboard extends StatefulWidget {
  const admindashboard({Key? key}) : super(key: key);
  @override
  State<admindashboard> createState() => _admindashboardState();
}

class _admindashboardState extends State<admindashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ,
      body: SafeArea(
        child: Container(
          // we will give media query height
          // double.infinity make it big as my parent allows
          // while MediaQuery make it big as per the screen

          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            // even space distribution
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,

                    ),

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("To the Admin Dashboard ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: (Colors.red[700]!),
                      fontSize: 15,

                    ),)
                ],
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("lib/assets/welcome.png")
                      )
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
