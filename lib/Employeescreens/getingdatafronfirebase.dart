import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class Emmployee {
  String id;
  String name;


  Emmployee(this.id, this.name,
      {this.reference});

  DocumentReference? reference;

  factory Emmployee.fromSnapshot(DocumentSnapshot snapshot) {
    Emmployee newEmployee = Emmployee.fromJson(snapshot.data() as Map<dynamic, dynamic>);
    newEmployee.reference = snapshot.reference;
    return newEmployee;
  }

  factory Emmployee.fromJson(Map<dynamic, dynamic> json) =>
      _employeeFromJson(json);
  Map<String, dynamic> toJson() => _employeeToJson(this);
  @override
  String toString() => 'name $name';
}
Emmployee _employeeFromJson(Map<dynamic, dynamic> data) {
  return Emmployee(
    data['id'],
    data['name'],

  );
}

Map<String, dynamic> _employeeToJson(Emmployee instance) {
  return {
    'id' : instance.id,
    'name': instance.name,

  };
}

