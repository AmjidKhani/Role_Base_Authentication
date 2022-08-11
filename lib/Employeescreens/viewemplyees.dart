import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'studenttry/datagrid.dart';
class SfDataGridLoadMoreApp extends StatelessWidget {
  final EmployeeDataGridSource employeeDataGridSource =
  EmployeeDataGridSource();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('DataGrid Lazy Loading'),
        ),
        body: SfDataGrid(
          source: employeeDataGridSource,
          columnWidthMode: ColumnWidthMode.fill,
          columns: [
            GridColumn(
                columnName: 'id',
                label: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'id',
                    overflow: TextOverflow.ellipsis,
                  ),
                  alignment: Alignment.centerRight,
                )),
            GridColumn(
                columnName: 'name',
                label: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'name',
                      overflow: TextOverflow.ellipsis,
                    ),
                    alignment: Alignment.centerLeft)),

          ],
       //   loadMoreViewBuilder: loadMoreButtonBuilder,
        ),
      ),
    );
  }



}
