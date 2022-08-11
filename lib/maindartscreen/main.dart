import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proj/Dashboard/admindashboard.dart';
import 'package:proj/Dashboard/hrdashboard.dart';
import 'package:proj/authprovider.dart';
import 'package:proj/homescreen/homescreen.dart';
import 'package:proj/login_signup_screen/signup.dart';
import 'package:proj/newscreens/newaddemploy.dart';
import 'package:proj/newscreens/newlogin.dart';
import 'package:proj/newscreens/newsignup.dart';
import 'package:provider/provider.dart';
import '../Employeescreens/studenttry/studentonedata.dart';
import '../Employeescreens/viewemplyees.dart';
import '../controller/Radiobuttoncontroller.dart';
import '../login_signup_screen/login.dart';
import '../login_signup_screen/login.dart';
import '../themechanger/themeclass.dart';
import '../themechanger/themedataservice.dart';
final FirebaseAuth _auth=FirebaseAuth.instance;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(SfDataGridLoadMoreApp());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (_)=>controlller()),

        Provider<AuthService>(
          create: (_)=>AuthService(FirebaseAuth.instance),
        ),
          StreamProvider(
              create:(context)=>context.read<AuthService>().authStateChange, initialData: null,
              ),
        ],
      child:GetMaterialApp(
        //backgroundColor: context.theme.backgroundColor,
        debugShowCheckedModeBanner: false,
        theme:Themes.lightmode,
          darkTheme: Themes.darkmode,
        themeMode: ThemeService().theme,
        home:SfDataGridLoadMoreApp(),
      ) ,
    );
  }
}
class AuthWrapper extends StatelessWidget{
  const AuthWrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user=context.watch<User>();
    if(User== null){
      return  newsignup();
    }
    else {
      return LoginPage();
    }
    // TODO: implement build
    throw UnimplementedError();
  }
}





