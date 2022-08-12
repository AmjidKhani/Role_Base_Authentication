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
  Widget loadMoreInfiniteBuilder(
      BuildContext context, LoadMoreRows loadMoreRows) {
    Future<String> loadRows() async {
      await loadMoreRows();
      return Future<String>.value('Completed');
    }
    return FutureBuilder<String>(
        initialData: 'loading',
        future: loadRows(),
        builder: (context, snapShot) {
          if (snapShot.data == 'loading') {
            return Container(
                height: 60.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: BorderDirectional(
                        top: BorderSide(
                            width: 1.0, color: Color.fromRGBO(0, 0, 0, 0.26)))),
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.deepPurple)));
          } else {
            return SizedBox.fromSize(size: Size.zero);
          }
        });
  }
}
