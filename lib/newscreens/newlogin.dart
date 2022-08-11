import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../login_signup_screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

final FirebaseAuth _auth=FirebaseAuth.instance;

class newlogin extends StatefulWidget {
  const newlogin({Key? key}) : super(key: key);
  @override
  State<newlogin> createState() => _newloginState();
}
class _newloginState extends State<newlogin> {
  String? Designation;
  String? Password;
  String firstvalue="Please Select Designation";
  final TextEditingController Email=TextEditingController();
  final TextEditingController password=TextEditingController();
  void _signIn()async{

    final User? user=(
        await _auth.signInWithEmailAndPassword(email: Email.text, password: password.text)
    ).user;
    if(user!=null){
      _checkRole();
     }
    else{
      Get.snackbar("User Not Found", "User May Be Deleted",colorText: Colors.purple);
    }
  }
  void _checkRole()async
  {
    User? user =FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap=await FirebaseFirestore.instance.collection('Users').doc(user?.uid).get();
    setState(() {
      Designation=snap['Role'];
    }
    );
    if(Designation=="Admin") {Get.to(admindashboard());}
    else if(Designation=="HR"){ Get.to(hrdashboard());
    }
    else if(Designation=="Manager"){  Get.to(managerdashboard());}
    else if(Designation=="Employ"){  Get.to(employdashboard());}
    else{
      Get.snackbar("Security message", "Please SignUp First");
    }
  }
  @override
  Widget build(BuildContext context) {
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
                    vertical: 125.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Login",textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Login  an Account",textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 150,
                    ),

                    ///  Column Start
                    ///
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

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
                            controller: Email,
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
                            controller: password,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Did't have an account ?",style: TextStyle(color: Colors.white),),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginPage()),
                                );
                              },
                              child: Text(" Sign up", style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.white
                              ),
                              ),
                            ),
                          ],
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
                                _signIn();
                              },
                              child: Text("Login",style: TextStyle(
                                  color: Color(0xFF527DAA),
                                  letterSpacing: 1.5,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold
                              ),),
                            )
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
