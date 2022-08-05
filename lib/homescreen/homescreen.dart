import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:proj/login_signup_screen/signup.dart';
import 'package:proj/newscreens/newlogin.dart';
import 'package:proj/newscreens/newsignup.dart';
import '../login_signup_screen/login.dart';
import '../login_signup_screen/signup.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  var logger = Logger();


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
                vertical: 120.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome",textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                   SizedBox(
                     height: 230,
                   ),
                   Column(
                   children: [

                     Container(
                         padding: EdgeInsets.symmetric(vertical: 25.0),
                         width: double.infinity,
                         height: 110,
                         child: RaisedButton(
                           elevation: 5.0,

                           onPressed: ()
                           {
Get.to(newlogin());
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
Get.to(newsignup());
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
                   ),

                  ],
                ),

          ),


            )


          ],
        )
    );
  }
}
      /*Scaffold(
      body: SafeArea(
        child: Container(


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

                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/assets/images/backgroundimages/background.png")
                    )
                ),
              ),


              Column(
                children: <Widget>[
                  // the login button
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      logger.d("Logger is working!");
                    },
                    // defining the shape
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black
                        ),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),
                    ),
                  ),
                  // creating the signup button
                  SizedBox(height:20),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));

                    },
                    color: const Color(0xff0095FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(

                      "Sign up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),
                    ),

                  ),


                ],
              )



            ],
          ),
        ),
      ),
    );
  }
}*/
