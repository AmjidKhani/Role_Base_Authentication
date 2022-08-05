import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class drawer extends StatefulWidget {
  @override
  _drawerState createState() => _drawerState();
}
class _drawerState extends State<drawer>{
  @override
  Widget build(BuildContext context) {
    final imageUrl="https://media.istockphoto.com/photos/put-more-in-get-more-out-picture-id1291318636?b=1&k=20&m=1291318636&s=170667a&w=0&h=UvVIk7wwkN3X9OFm8gBlWWviV5vAjfrq2ejYP30JmnA=";
    //final imageUrl="https://i.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI";
    return Container(
      child: Drawer(
        child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(color: Colors.red),
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Amjad khan"),
                  accountEmail:Text("amjidkhaniuoh@gamil.com") ,
                  currentAccountPicture:CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                ),
              ),
              ListTile(
                leading:
                Icon(
                  CupertinoIcons.home,
                  color: Colors.black,),
                title: Text("Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.black),),
              ),
              ListTile(
                leading:
                Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.black,),
                title: Text("Profile",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.black),),
              ),
              ListTile(
                leading:
                Icon(
                  CupertinoIcons.star,
                  color: Colors.black,),
                title: Text("Favorites",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.black),),
              ),
              ListTile(
                leading:
                Icon(
                  CupertinoIcons.clock,
                  color: Colors.black,),
                title: Text("Recent",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.black),),
              ),
              ListTile(
                leading:
                Icon(
                  CupertinoIcons.cloud_upload,
                  color: Colors.black,),
                title: Text("Upload",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.black),),
              ),
              ListTile(
                leading:
                Icon(
                  CupertinoIcons.check_mark_circled,
                  color: Colors.black,),
                title: Text("Offline",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.black),),
              ),
              ListTile(
                leading:
                Icon(
                  CupertinoIcons.arrowshape_turn_up_right,
                  color: Colors.black,),
                title: Text("Sharred",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.black),),
              ),
              ListTile(
                leading:
                Icon(
                  CupertinoIcons.cloud_upload_fill,
                  color: Colors.black,),
                title: Text("Backup",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.black),),
              ),
              ListTile(
                leading:
                Icon(
                  CupertinoIcons.trash_fill,
                  color: Colors.black,),
                title: Text("Trash",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.black),),
              ),
              ListTile(
                leading:
                Icon(
                  CupertinoIcons.mail,
                  color: Colors.black,),
                title: Text("Email Me",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.black),),
              )
            ]
        ),
      ),
    );
  }
}