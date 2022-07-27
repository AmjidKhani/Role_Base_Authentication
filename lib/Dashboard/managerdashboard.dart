import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class managerdashboard extends StatefulWidget {
  const managerdashboard({Key? key}) : super(key: key);

  @override
  State<managerdashboard> createState() => _managerdashboardState();
}

class _managerdashboardState extends State<managerdashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Text("To the Manager Dashboard ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: (Colors.lightBlueAccent[700]!),
                      fontSize: 15,

                    ),)
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/assets/welcome.png")
                    )
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
