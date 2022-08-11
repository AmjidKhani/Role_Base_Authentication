
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../Dashboard/admindashboard.dart';
import '../Employeescreens/employdashboard.dart';
import '../Dashboard/hrdashboard.dart';
import '../Dashboard/managerdashboard.dart';
import '../login_signup_screen/login.dart';

class securitycheck{


 static final TextEditingController Emailcontroller=TextEditingController();

 static TextEditingController PasswordController=TextEditingController();
 static String? SelectDesig;

 static String firstvalue="Please Select Designation";

 static securitycheckinfortextfield(){
    if(Emailcontroller.text.isEmpty)
    {
      Fluttertoast.showToast(
          msg: " Email Fields Must Not Be Empty",backgroundColor: Colors.white,textColor: Colors.black
      );
    }
    else if(
    PasswordController.text.isEmpty)
    {
      Fluttertoast.showToast(
          msg: " Password Field Must Not Be Empty",backgroundColor: Colors.white,textColor: Colors.black
      );
    }

    else if( SelectDesig=="Admin") {


      Get.to((admindashboard()));

    }
    else if(SelectDesig=="HR"){

      Get.to(hrdashboard());

    }
    else if(SelectDesig=="Manager"){

      Get.to(managerdashboard());
      }
    else if(SelectDesig=='Employ')
    {
      Get.to((employdashboard()));

    }
    else
    {
      Fluttertoast.showToast(
          msg: " Please Select Designation",backgroundColor: Colors.white,textColor: Colors.black
      );

    }

  }
}