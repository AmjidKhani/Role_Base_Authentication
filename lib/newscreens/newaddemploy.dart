import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proj/newscreens/newlogin.dart';
import '../controller/Radiobuttoncontroller.dart';
import 'package:get/get.dart';
import 'package:proj/Dashboard/admindashboard.dart';
import 'package:proj/Employeescreens/employdashboard.dart';
import 'package:proj/Dashboard/hrdashboard.dart';
import 'package:proj/Dashboard/managerdashboard.dart';
import 'package:proj/Helper/securitycheckfortextfielddrop.dart';
import 'package:proj/authprovider.dart';
import 'package:proj/login_signup_screen/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../homescreen/homescreen.dart';
import 'dart:developer';

class newaddemploy extends StatefulWidget {
  const newaddemploy({Key? key}) : super(key: key);

  @override
  State<newaddemploy> createState() => _newaddemployState();
}
class _newaddemployState extends State<newaddemploy> {
  //String? valueselected;
  var radiovaluechange;
  var storeselectedvalue;
  @override
  Widget build(BuildContext context) {

    final valuechange = Provider.of<controlller>(context, listen: false);

    print("Widget tree destroy");
    final TextEditingController Namecontroller = TextEditingController();
    final TextEditingController idcontroller = TextEditingController();
    final TextEditingController cniccontroller = TextEditingController();
    final TextEditingController gendercontroller = TextEditingController();
    final TextEditingController citycontroller = TextEditingController();
    final TextEditingController Rolecontroller = TextEditingController();
    final TextEditingController phonenocontroller = TextEditingController();
    final firestoreInstance = FirebaseFirestore.instance;
    CollectionReference products = FirebaseFirestore.instance.collection("Employee");

    addEmployy() {
      products.add({
        'id': idcontroller.text,
        'User_Name': Namecontroller.text,
        'Phone_no': phonenocontroller.text,
        'Cnic': cniccontroller.text,
        'Role': Rolecontroller.text,
       // 'gender': radiovaluechange,
         'gender': Provider.of<controlller>(context, listen: false).selectedvalue
      }).then((value) {
        print("Data added Successfully");
        Get.to(hrdashboard());
      }).onError((error, stackTrace) {
        print('Error$error');
      });
    }
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF73AEF5),
                Color(0xFF61AEF1),
                Color(0xFF478DE0),
                Color(0xFF398AE5),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ),
          ),
        ),
        Container(
          //color: Colors.purple,
          height: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add Employee",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Text(
                      'ID',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Color(0xFF6CA8F1),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6.0,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      height: 60.0,
                      child: TextField(
                        controller: idcontroller,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.white,
                          //  fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(
                            Icons.fact_check_outlined,
                            color: Colors.white,
                          ),
                          hintText: 'Enter your Id',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Color(0xFF6CA8F1),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6.0,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      height: 60.0,
                      child: TextField(
                        controller: Namecontroller,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.white,
                          //  fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          hintText: 'Enter your Name',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Phone no',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Color(0xFF6CA8F1),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6.0,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      height: 60.0,
                      child: TextField(
                        controller: phonenocontroller,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          color: Colors.white,
                          //  fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          hintText: 'Enter your Phone no',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Cnic',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Color(0xFF6CA8F1),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6.0,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      height: 60.0,
                      child: TextField(
                        controller: cniccontroller,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          color: Colors.white,
                          //  fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          hintText: 'Enter Your Cnic',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Role',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Color(0xFF6CA8F1),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6.0,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      height: 60.0,
                      child: TextField(
                        controller: Rolecontroller,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.white,
                          //  fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(
                            Icons.manage_accounts_rounded,
                            color: Colors.white,
                          ),
                          hintText: 'Enter Your Job Title',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),

                    ///
                    ///   Radio button
                    ///
                    ///
                    ///
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Color(0xFF6CA8F1),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6.0,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      height: 60.0,
                      child: Row(children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            "Gender",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        )),
                        Row(
                          children: [
                            Consumer<controlller>(
                              builder: (context, value, child) {
                                return Radio(
                                  value: "Male",
                                  groupValue: value.selectedvalue,

                                  onChanged: (val) {
                                    value.onchangegender(val);
                                  },

                                  activeColor: Colors.purple,
                                  fillColor:
                                  MaterialStateProperty.all(Colors.white),
                                );
                              },
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Row(
                            children: [
                              Consumer<controlller>(
                                builder: (context, value, child) {
                                  return Radio(
                                    value: "Female",
                                    groupValue:
                                    //radiovaluechange,
                                    value.selectedvalue,
                                    onChanged: (val) {
                                      value.onchangegender(val);
                                    },
                                    activeColor: Colors.white,
                                    fillColor:
                                    MaterialStateProperty.all(Colors.white),
                                  );
                                },
                              ),
                              Text(
                                "Female",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),

                    /////Radiobutton
                    ///
                    /// /
                    ///
                    ///
                    ///

                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 25.0),
                        width: double.infinity,
                        height: 110,
                        child: RaisedButton(
                          elevation: 5.0,
                          onPressed: () {

                           addEmployy();
                           // Get.back();
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: Color(0xFF527DAA),
                                letterSpacing: 1.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
