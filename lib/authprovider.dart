import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/Dashboard/admindashboard.dart';
import 'package:proj/Dashboard/employdashboard.dart';
import 'package:proj/Dashboard/hrdashboard.dart';
import 'package:proj/Dashboard/managerdashboard.dart';
import 'package:proj/Helper/securitycheckfortextfielddrop.dart';
import 'package:proj/login_signup_screen/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
class AuthService{
  final FirebaseAuth _auth;
  User? user =FirebaseAuth.instance.currentUser;
  //final DocumentSnapshot snap= FirebaseFirestore.instance as DocumentSnapshot<Object?>;
  AuthService(this._auth);
  Stream<User?> get authStateChange=> _auth.idTokenChanges();

  Future<String> Login(String email,String password)async
  {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password:password);
          return "Welcome To The Dashboard";
    }catch(e){
      return ('Error=  $e.toString()');
    }
    }
  Future<String> signup(String email,String password)async
  {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return
        "Sign_Up In";
    }catch(e){
      return e.toString();
    }
  }
  }
