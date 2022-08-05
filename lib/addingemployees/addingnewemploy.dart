import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proj/addingemployees/reusableclasstextfield.dart';
import 'package:provider/provider.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../controller/Radiobuttoncontroller.dart';

class addingemploy extends StatefulWidget {
  const addingemploy({Key? key}) : super(key: key);

  @override
  State<addingemploy> createState() => _addingemployState();
}

class _addingemployState extends State<addingemploy> {
  final TextEditingController Namecontroller = TextEditingController();
  final TextEditingController idcontroller = TextEditingController();
  final TextEditingController cniccontroller = TextEditingController();
  final TextEditingController gendercontroller = TextEditingController();
  final TextEditingController citycontroller = TextEditingController();
  final TextEditingController Emailcontroller = TextEditingController();
  final TextEditingController phonenocontroller = TextEditingController();
  final TextEditingController Date_of_Birth_controller =
      TextEditingController();
  final TextEditingController joiningdatecontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  static final GlobalKey<ScaffoldState> _scaffoldkey =
      GlobalKey<ScaffoldState>();
  final firestoreInstance = FirebaseFirestore.instance;
  CollectionReference products =
      FirebaseFirestore.instance.collection("Employee");

  addEmployy() {
    products.add({
      'id': idcontroller.text,
      'User_Name': Namecontroller.text,
      'Phone_no': phonenocontroller.text,
      'Cnic': cniccontroller.text,
      'Email': Emailcontroller.text,
      'gender': radiovaluechange
//value.onchangegender.,
    }).then((value) {
      print("Data added Successfully");
    }).onError((error, stackTrace) {
      print('Error$error');
    });
  }

  var radiovaluechange;

  @override
  Widget build(BuildContext context) {
    final valuechange = Provider.of<controlller>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        key: _scaffoldkey,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Add Employ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: idcontroller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(14.0),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Enter id",
                  labelStyle: TextStyle(),
                  hintText: "Enter Id",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.amber,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
              TextField(
                controller: Namecontroller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(14.0),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Name",
                  labelStyle: TextStyle(),
                  hintText: "Enter User Name",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.amber,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),

              TextField(
                controller: phonenocontroller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(14.0),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Phone no",
                  labelStyle: TextStyle(),
                  hintText: "Enter Phone no",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.amber,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
              TextField(
                controller: cniccontroller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(14.0),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Cnic",
                  labelStyle: TextStyle(),
                  hintText: "Enter Cnic",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.amber,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
              TextField(
                controller: Emailcontroller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(14.0),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Email",
                  labelStyle: TextStyle(),
                  hintText: "Enter Enter Email",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.amber,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //   Radiobutton container
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 65,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(9)),
                  child: Row(children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Gender",
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
                    Row(
                      children: [
                        Consumer<controlller>(
                          builder: (context, value, child) {
                            return Radio(
                              value: "Male",
                              groupValue: value.selectedvalue,
                              onChanged: (val) {
                                radiovaluechange = val;
                                value.onchangegender(radiovaluechange);
                              },
                              activeColor: Colors.purple,
                              fillColor:
                                  MaterialStateProperty.all(Colors.black),
                            );
                          },
                        ),
                        Text(
                          "Male",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Row(
                        children: [
                          Consumer<controlller>(
                            builder: (context, value, child) {
                              return Radio(
                                value: "Female",
                                groupValue: radiovaluechange,
                                //value.selectedvalue,
                                onChanged: (val) {
                                  setState(() {
                                    radiovaluechange = val;
                                  });
                                  value.onchangegender(val);
                                },
                                activeColor: Colors.purple,
                                fillColor:
                                    MaterialStateProperty.all(Colors.black),
                              );
                            },
                          ),
                          Text(
                            "Female",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
                width: 150,
                child: ElevatedButton(
                    onPressed: () {
                      addEmployy();
                      //print("Data added");
                    },
                    child: const Text("Submit")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
