import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class completedprojects extends StatefulWidget {
  const completedprojects({Key? key}) : super(key: key);

  @override
  State<completedprojects> createState() => _completedprojectsState();
}

class _completedprojectsState extends State<completedprojects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Competed Projects"),
        centerTitle: true,

      ),
      body: Center(child: Text("Welcome to the Completed Projects Pa"
          "ge",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
    );
  }
}
