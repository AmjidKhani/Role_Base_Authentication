import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proj/newscreens/newlogin.dart';

import '../login_signup_screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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

class newsignup extends StatefulWidget {
  const newsignup({Key? key}) : super(key: key);
  @override
  State<newsignup> createState() => _newsignupState();
}

class _newsignupState extends State<newsignup> {
  String  _selectedRole="Select Role";
  String? valueselected;
  final  items=['Admin','HR','Manager','Employ'];
  final _rolelist=["Admin","HR","Manager","Employ"];
  String? _RoleSelect="Select Role";
  @override
  Widget build(BuildContext context) {
    final TextEditingController UserNameController=TextEditingController();
    final TextEditingController Emailcontroller=TextEditingController();
    final TextEditingController PasswordController=TextEditingController();
    final TextEditingController ConformPasswordController=TextEditingController();

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
                padding: EdgeInsets.symmetric(horizontal: 40.0,
                    vertical: 65.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sign up",textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Create an account its free",textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                SizedBox(
                  height: 30,
                ),
                    ///  Column Start
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: Colors.blue.shade200,
                        ),
                        child: DropdownButtonFormField(
                          dropdownColor: Color(0xFF6CA8F1),

                          items: _rolelist.map((e) => DropdownMenuItem(

                            child: Padding(
                              padding: const EdgeInsets.only(left: 50.0),
                              child: Text(e,style: TextStyle(color:Colors.white),),
                            ),value: e,)
                          ).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              _RoleSelect=value;
                            });
                          },
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                            size: 30,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.multiple_stop,
                              color: Colors.white,
                            ),
                            contentPadding: EdgeInsets.only(top: 14.0),
                            hintText: 'Enter your Role',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',

                            ),
                          ),

                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'User Name',
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
                        controller: UserNameController ,
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
                          hintText: 'Enter your User Name',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Email',
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
                        controller: Emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.white,
                          //  fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          hintText: 'Enter your Email',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Password',
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
                        controller: PasswordController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.white,
                          //  fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.white,
                          ),
                          hintText: 'Enter your Password',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Conform Password',
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
                        controller: ConformPasswordController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.white,
                          //  fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(
                            Icons.password,
                            color: Colors.white,
                          ),
                          hintText: 'Conform Password',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 25.0),
                        width: double.infinity,
                        height: 110,
                        child: RaisedButton(
                          elevation: 5.0,
                          onPressed: ()
                          {
                            final String email =Emailcontroller.text.trim();
                            final String password=PasswordController.text.trim();

                            context.read<AuthService>().signup(email ,password).then((value) async {
                              User? user =FirebaseAuth.instance.currentUser;
                              await FirebaseFirestore.instance.collection(
                                  'Users').doc(user?.uid).
                              set({
                                'uid':user?.uid,
                                'username':UserNameController.text,
                                'email':email,
                                'password':password,
                                'Conform Password':ConformPasswordController.text,
                                'Role':_RoleSelect,
                              }).onError((error, stackTrace) {
                                print("Error$error");
                              });
                              //Get.to(LoginPage());
                            });
                            if(User== null){
                              Get.to(homescreen());
                            }
                            else {
                              Get.to(newlogin());
                            }
                          },
                          child: Text("Sign Up",style: TextStyle(
                              color: Color(0xFF527DAA),
                              letterSpacing: 1.5,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                          ),),
                        )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Already have an account ?",style: TextStyle(color: Colors.white),),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => newlogin()),
                              );
                            },
                            child: Text(" Login", style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.white

                            ),
                            ),
                        ),

                      ],
                    ),
                  ],
                ),
                    SizedBox(
                      height: 230,
                    ),
                   /* Column(
                      children: [

                        Container(
                            padding: EdgeInsets.symmetric(vertical: 25.0),
                            width: double.infinity,
                            height: 110,
                            child: RaisedButton(
                              elevation: 5.0,

                              onPressed: ()
                              {

                              },
                              child: Text("LOGIN",style: TextStyle(
                                  color: Color(0xFF527DAA),
                                  letterSpacing: 1.5,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold
                              ),),
                            )
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(vertical: 25.0),
                            width: double.infinity,
                            height: 110,
                            child: RaisedButton(
                              color: Colors.white,
                              elevation: 5.0,

                              onPressed: ()
                              {

                              },
                              child: Text("Sign up",style: TextStyle(
                                  color: Color(0xFF527DAA),
                                  letterSpacing: 1.5,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold
                              ),),
                            )
                        ),
                      ],
                    ),*/

                  ],
                ),

              ),


            )


          ],
        )
    );
  }
}
