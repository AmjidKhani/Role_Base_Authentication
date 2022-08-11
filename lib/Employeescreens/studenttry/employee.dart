import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class Employee {
  String? name;
String? id;

  Employee( this.name,this.id,
      { this.reference});

  DocumentReference? reference;

  factory Employee.fromSnapshot(DocumentSnapshot snapshot) {
    Employee newEmployee = Employee.fromJson(snapshot.data() as Map<dynamic, dynamic>);
    newEmployee.reference = snapshot.reference;
    return newEmployee;
  }

  factory Employee.fromJson(Map<dynamic, dynamic> json) =>
      _employeeFromJson(json);
  Map<String, dynamic> toJson() => _employeeToJson(this);
  @override
  String toString() => 'name $name';
}
Employee _employeeFromJson(Map<dynamic, dynamic> data) {
  return Employee(

      data['id'],
    data['name'],
  );
}

Map<String, dynamic> _employeeToJson(Employee instance) {
  return {
    'id':instance.id,
    'name' : instance.name,

  };
}

