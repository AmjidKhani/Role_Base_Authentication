import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'datasourceclass.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'employee.dart';
class onlyonestudent extends StatefulWidget {
  const onlyonestudent({Key? key}) : super(key: key);

  @override

  State<onlyonestudent> createState() => _onlyonestudentState();
}

class _onlyonestudentState extends State<onlyonestudent> {
  @override

  late EmployeeDataSource employeeDataSource;

  List<Employee> employeeData = [];

 getDataFromDatabase() async {
   var value= FirebaseFirestore.instance;
   var getvalue=value.collection('student');

  // FirebaseFirestore.instance.collection("student");
  // var value = FirebaseDatabase.instance.reference();
    //var getvalue =await value.child("Employee").once();
   //return getvalue;
   return getvalue;
  }

  Widget _buildDataGrid() {
    return FutureBuilder(
      future: getDataFromDatabase(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          var showData = snapshot.data.document;
          Map<String,dynamic>   values = showData.value.document ;
          List<dynamic> key = values.keys.toList();

          for (int i = 0; i < key.length; i++) {

            final data = values[key[i]
            ];
            employeeData.add(Employee
              (
              data['id'],
              data['name'],
            )
            );
          }
          employeeDataSource = EmployeeDataSource(employeeData);
          return SfDataGrid(
            source: employeeDataSource,
            columns: <GridColumn>[
              GridColumn(
                  columnName: 'id',
                  label: Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: Text(
                        'ID',
                      )
                  )
              ),
              GridColumn(
                  columnName: 'name',
                  label: Container(
                      padding: EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: Text('Name'))),
            ],
          );
        }
        else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    //CollectionReference reference = Firestore.instance.collection('users');
    getDataFromDatabase();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syncfusion flutter datagrid firebase demo'),
      ),
      body: _buildDataGrid(),
    );
  }
}
