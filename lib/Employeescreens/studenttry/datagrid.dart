import 'dart:async';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../getingdatafronfirebase.dart';
import '../getingdatafronfirebase.dart';


class EmployeeDataGridSource extends DataGridSource {
  EmployeeDataGridSource() {
    collection = FirebaseFirestore.instance.collection('student');
  }

  late CollectionReference collection;

  static const double perPage = 50;

  List<Emmployee> Employee = [];

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
          if (dataGridCell.columnName == 'id' ||
              dataGridCell.columnName == 'name') {
            return Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(dataGridCell.value.toString(),
                  overflow: TextOverflow.ellipsis
              ),
            );
          }
          return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(dataGridCell.value.toString(),
                overflow: TextOverflow.ellipsis),
          );
        }).toList());
  }

  void addDataGridRow(Emmployee data) {
    dataGridRows.add(DataGridRow(cells: [
      DataGridCell<String>(columnName: 'id', value: data.id),
      DataGridCell<String>(columnName: 'name', value: data.name),
    ]
    )
    );
  }

}
