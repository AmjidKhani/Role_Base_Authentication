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
class LoginPage extends StatefulWidget {
 // static String? SelectDesig;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   String? Designation;
   String? Password;
     String firstvalue="Please Select Designation";
final TextEditingController Email=TextEditingController();
   final TextEditingController password=TextEditingController();
   void _signIn()async{

     final User? user=(
         await _auth.signInWithEmailAndPassword(email: Email.text, password: password.text)
     ).user;
     if(user==null){
       Get.snackbar("User Not Found", "User May Be Deleted",colorText: Colors.purple);
     }
     else{
       _checkRole();
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

  // String email=securitycheck.Emailcontroller.toString();
   //String password=securitycheck.Emailcontroller.toString();
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Login",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Text("Login to your account",
                      style: TextStyle(
                          fontSize: 15,
                          color:Colors.grey[700]),)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      ///  Email Text Filed
                      ///
                      TextField(

                        controller:Email ,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 0,
                                horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: (Colors.grey[400])!,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: (Colors.grey[400])!),
                            )
                        ),
                      ),
                      ///    password textfield
                      ///
                      SizedBox(
                        height: 20,
                      ),
                      TextField(

                        controller:password ,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 0,
                                horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: (Colors.grey[400])!,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: (Colors.grey[400])!),
                            )
                        ),
                      ),
                     ],
                  ),
                ),

                Padding(padding:
                EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration:
                    BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                    ),


                    ////////////////////////Login Button ///////////////////////////

                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        _signIn();
                       // context.read<AuthService>().Login(Email.text, password.text);
                       // _checkRole();

                        },
                      color: Color(0xff0095FF),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Login", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?"),
      GestureDetector(
        onTap: () {
Get.to(SignupPage());
          },
          child: Text(" Sign up", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,

                    ),)),
                  ],
                ),

                Container(
                  padding: EdgeInsets.only(top: 100),
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(" lib/assets/images/backgroundimages/background.png"),
                        fit: BoxFit.fitHeight
                    ),

                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

}


 /* Widget inputFile({label, obscureText = false ,required TextEditingController controller} )
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
                  color: (Colors.grey[400])!,
              ),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: (Colors.grey[400])!),
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}


  */
