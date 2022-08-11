import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Employeescreens/addingnewemploy.dart';
import '../mainscreens/attendencepage.dart';
import '../mainscreens/competedprojects.dart';
import '../mainscreens/projects.dart';
import '../Employeescreens/employdashboard.dart';
import 'managerdashboard.dart';

class hrdashboard extends StatefulWidget {
  const hrdashboard({Key? key}) : super(key: key);

  @override
  State<hrdashboard> createState() => _hrdashboardState();
}

class _hrdashboardState extends State<hrdashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("",),),
      body: Column(
        children: <Widget>[
          SizedBox(height:20 ,),
          Text("Dashboard",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),
              textAlign:TextAlign.start ),
          SizedBox(
            height: 30,
          ),
          Container(
            //  padding: EdgeInsets.only(left: 10,right: 10,top: 10),
            child: Flexible(
              child: GridView.count(
                mainAxisSpacing: 10,
                primary: false,
                crossAxisCount: 2,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(addingemploy());
                    },
                    child: Card(
                      child: Column(
                        children: <Widget>[


                          Image.asset('lib/assets/images/dashboardimages/hr1.png',fit: BoxFit.fill,),
                          SizedBox(height: 10,),
                          Text(" Add Employees",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),

                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(managerdashboard());
                    },
                    child: Card(
                      child: Column(
                        children: <Widget>[


                          Image.asset('lib/images/manager.png',fit: BoxFit.fill,),
                          SizedBox(height: 10,),
                          Text("Manager",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),

                          )
                        ],
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      Get.to(attendencepage());
                    },
                    child: Card(
                      child: Column(
                        children: <Widget>[


                          Image.asset('lib/images/approval.png',fit: BoxFit.fill,),
                          SizedBox(height: 10,),
                          Text("Attendence",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),

                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(projects());
                    },
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Image.asset('lib/images/projects.png',fit: BoxFit.fill,),
                          SizedBox(height: 10,),
                          Text("Projects",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),

                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(completedprojects());
                    },
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Image.asset('lib/images/check.png',fit: BoxFit.fill,),
                          SizedBox(height: 10,),
                          Text("Competed Projects",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
