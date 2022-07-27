import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/authprovider.dart';
import 'package:proj/homescreen/homescreen.dart';
import 'package:proj/login_signup_screen/signup.dart';
import 'package:provider/provider.dart';

import 'login_signup_screen/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class AuthWrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final user=context.watch<User>();
    if(User!=null){
      return LoginPage();
    }
    else {
      return homescreen();
    }


    // TODO: implement build
    throw UnimplementedError();
  }
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
        Provider<AuthService>(
          create: (_)=>AuthService(FirebaseAuth.instance),
        ),
          StreamProvider(
              create:(Context)=>context.read<AuthService>().authStateChange, initialData: null,
              ),
        ],
      child:GetMaterialApp(
        home: homescreen(),
      ) ,
    );
  }
}





