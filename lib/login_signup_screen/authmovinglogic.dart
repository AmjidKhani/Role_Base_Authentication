import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../homescreen/homescreen.dart';
import 'login.dart';

class AuthWrapper extends StatelessWidget{
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user=context.watch<User>();
    if(User== null){
      return  homescreen();

    }
    else {
      return LoginPage();
    }
    // TODO: implement build
    throw UnimplementedError();
  }
}