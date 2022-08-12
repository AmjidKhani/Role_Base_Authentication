import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:proj/Employeescreens/employdashboard.dart';
import 'package:proj/Dashboard/hrdashboard.dart';
import 'package:proj/Dashboard/managerdashboard.dart';
import 'package:proj/mainscreens/competedprojects.dart';
import 'package:proj/drawer/drawer.dart';
import 'package:proj/mainscreens/projects.dart';
import 'package:proj/themechanger/themedataservice.dart';
import '../mainscreens/attendencepage.dart';

class admindashboard extends StatefulWidget {
  const admindashboard({Key? key}) : super(key: key);
  @override
  State<admindashboard> createState() => _admindashboardState();
}
class _admindashboardState extends State<admindashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer:SizedBox(
          width: 230,
            child: drawer(),),
        appBar: AppBar(
          backgroundColor:Colors.green,
          elevation: 0,
          //leadingWidth: 390,
          actions: [
  GestureDetector(
    onTap: (){
ThemeService().switchTheme();
    },
    child: IconButton(onPressed: (){},
        icon: Icon(Get.isDarkMode?
        Icons.wb_sunny :Icons.nightlight_round,
          size: 20,
          color: Get.isDarkMode ?
          Colors.white:Colors.black,)),
  )
],
        ),
        body:Column(
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
                                        Get.to(hrdashboard());
                                      },
                                      child: Card(
                              child: Column(
                                             children: <Widget>[


                                                 Image.asset('lib/assets/images/dashboardimages/hr1.png',),
                         SizedBox(height: 10,),
                         Text("HR",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),

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


                                            Image.asset('lib/assets/images/dashboardimages/manager.png',fit: BoxFit.fill,),
                                            SizedBox(height: 10,),
                                            Text("Manager",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),

                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    //
                                    //
                                    //         Employee dashboard


                                    GestureDetector(
                                      onTap: (){

                                        //Get.to( EmployeeDataGridSource());
                                      },
                                      child: Card(
                                        child: Column(
                                          children: <Widget>[


                                            Image.asset('lib/assets/images/dashboardimages/division.png',fit: BoxFit.fill,),
                                            SizedBox(height: 10,),
                                            Text("Employee",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),

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


                                            Image.asset('lib/assets/images/dashboardimages/approval.png',fit: BoxFit.fill,),
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
                                            Image.asset('lib/assets/images/dashboardimages/projects.png',fit: BoxFit.fill,),
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


                                            Image.asset('lib/assets/images/dashboardimages/check.png',fit: BoxFit.fill,),
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
      ),
    );
  }
}
