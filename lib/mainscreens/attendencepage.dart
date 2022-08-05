import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class attendencepage extends StatefulWidget {
  const attendencepage({Key? key}) : super(key: key);

  @override
  State<attendencepage> createState() => _attendencepageState();
}

class _attendencepageState extends State<attendencepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text("Attendence"),
  centerTitle: true,

),
      body: Center(child: Text("Welcome to the Attendence Page",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
    );
  }
}
