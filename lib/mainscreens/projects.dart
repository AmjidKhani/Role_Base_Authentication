import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class projects extends StatefulWidget {
  const projects({Key? key}) : super(key: key);

  @override
  State<projects> createState() => _projectsState();
}

class _projectsState extends State<projects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projects"),
        centerTitle: true,

      ),
      body: Center(child: Text("Welcome to the Projects Page",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
    );
  }
}
