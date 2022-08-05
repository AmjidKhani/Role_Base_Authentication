import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/Dashboard/admindashboard.dart';
import 'package:proj/Dashboard/employdashboard.dart';
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
import 'login.dart';
import 'dart:developer';
class SignupPage extends StatefulWidget {
   @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

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
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),


        ),
      ),
      body:  SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Sign up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,

                      ),),
                    SizedBox(height: 20,),
                    Text("Create an account, It's free ",
                      style: TextStyle(
                          fontSize: 15,
                          color:Colors.grey[700]),)


                  ],
                ),
                Column(
                  children: <Widget>[
                    DropdownButtonFormField(
                      items: _rolelist.map((e) => DropdownMenuItem(
                        child: Text(e),value: e,)
                      ).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _RoleSelect=value;
                        });
                      },
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black38,
                        size: 40,
                      ),
                      decoration:
                      InputDecoration(
                          labelText: "Select Designation",
                          border: UnderlineInputBorder()

                      ),

                    ),
                    SizedBox(height: 20,),
                    inputFile(label: "Username",controller: UserNameController ),
                    inputFile(label: "Email",controller: Emailcontroller),
                    inputFile(label: "Password", obscureText: true,controller: PasswordController),
                    inputFile(label: "Confirm Password ", obscureText: true,controller: ConformPasswordController),
                    //inputFile(label: "Designation"),

                  ],
                ),



                Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  decoration:
                  BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                  ),
                  child: MaterialButton(

                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
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
                        Get.to(LoginPage());
                      }

                      },
    color: Color(0xff0095FF),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Sign up", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,

                    ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account ?"),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(" Login", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,

                        ),)),

                  ],
                )
              ],
            ),
          ),
      ),
      
       );
  }
}  //main close
// we will be creating a widget for text field
Widget inputFile({label, obscureText = false, required TextEditingController controller
})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(

        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (Colors.grey[400]!)
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: (Colors.grey[400]!),
            ),
        ),
      ),
      ),
      SizedBox(height: 10,),

    ],
  );
}
