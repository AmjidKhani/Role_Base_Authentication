import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class employeedata extends StatefulWidget {
  const employeedata({Key? key}) : super(key: key);

  @override
  State<employeedata> createState() => _employeedataState();
}

class _employeedataState extends State<employeedata> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 30),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      "ID",
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 65,
                    ),
                    Text("Name",
                        style: TextStyle(
                            color: Colors.pink,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 60,
                    ),
                    Text("Gender",
                        style: TextStyle(
                            color: Colors.pink,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 45,
                    ),
                    Text("Role",
                        style: TextStyle(
                            color: Colors.pink,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 40,
                    ),
                    Text("Phone_no",
                        style: TextStyle(
                            color: Colors.pink,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 40,
                    ),
                    Text("Cnic",
                        style: TextStyle(
                            color: Colors.pink,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Employee')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text("no data Exists"),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                )),
                                headingRowHeight: 0,
                                columns: [
                                  DataColumn(
                                    label: Container(),
                                  ),
                                  DataColumn(label: Container()),
                                  DataColumn(
                                    label: Container(),
                                  ),
                                  DataColumn(
                                    label: Container(),
                                  ),
                                  DataColumn(
                                    label: Container(),
                                  ),
                                  DataColumn(
                                    label: Container(),
                                  ),
                                ],
                                rows: [
                                  DataRow(cells: [
                                    DataCell(
                                      ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxWidth: 50,
                                            minWidth: 50,
                                          ),
                                          child: Text(
                                            snapshot.data!.docs[index]['id'],
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                    ),
                                    DataCell(ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxWidth: 50,
                                          minWidth: 50,
                                        ),
                                        child: Text(
                                          snapshot.data!.docs[index]
                                              ['User_Name'],
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.ellipsis,
                                        ))),
                                    DataCell(ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxWidth: 50,
                                          minWidth: 50,
                                        ),
                                        child: Text(
                                          snapshot.data!.docs[index]['gender'],
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.ellipsis,
                                        ))),
                                    DataCell(
                                      ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxWidth: 50,
                                            minWidth: 50,
                                          ),
                                          child: Text(
                                            snapshot.data!.docs[index]['Role'],
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                    ),
                                    DataCell(ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxWidth: 50,
                                          minWidth: 50,
                                        ),
                                        child: Text(
                                          snapshot.data!.docs[index]
                                              ['Phone_no'],
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.ellipsis,
                                        ))),
                                    DataCell(ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxWidth: 50,
                                          minWidth: 50,
                                        ),
                                        child: Text(
                                          snapshot.data!.docs[index]['Cnic'],
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.ellipsis,
                                        )))
                                  ])
                                ]),
                          ),
                        );

                        //Text(snapshot.data!.docs[index]['name']);
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


}
