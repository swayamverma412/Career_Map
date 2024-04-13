import 'package:career_map/HomeScreen/CarrerOptions/Carreroption.dart';
import 'package:career_map/HomeScreen/HomePage.dart';
import 'package:career_map/HomeScreen/api_test.dart';
import 'package:career_map/helper/AppColor.dart';
import 'package:career_map/helper/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/AppContent.dart';
import '../base/Perferance.dart';
import '../helper/route_helper.dart';
import 'MccAnd mss/Mcc.dart';
import 'MccAnd mss/Msm.dart';

class BottomNavigation_Screnn extends StatefulWidget {
  const BottomNavigation_Screnn({Key? key}) : super(key: key);

  @override
  State<BottomNavigation_Screnn> createState() => _BottomNavigation_ScrennState();
}

class _BottomNavigation_ScrennState extends State<BottomNavigation_Screnn> {
  int _selectindex=0;
static List<String> appbar=["Feed","Carrier option","Api Test","MCC","MSM"];
  static const List<Widget> _pages = <Widget>[
    Home_Screen(),
    Carrer_option(),
   ApiTest(),
    Mcc_page(),
    Msm()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        shadowColor: Colors.grey.shade500,
        title: Text(appbar[_selectindex],style: TextStyle(color:Colors.black87,fontSize: 17,fontWeight: FontWeight.w800,letterSpacing: 0.3)),
        actions: [
          InkWell(
            onTap: (){
              Get.toNamed(RouteHelper.Edit_Profile);
            },
            child: CircleAvatar(
              backgroundImage:AssetImage("asset/profile_demo.png"),
              radius: 20,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
    child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
      children: [
         DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              CircleAvatar(
                backgroundImage:AssetImage("asset/profile_demo.png"),
                radius: 30,
              ),
              SizedBox(height: 15,),
           Text('Hi User Demo',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 15)),
            ],
          ),
        ),
        Card(
          elevation: 2,
          shadowColor: Colors.grey.shade600,
          child:  ListTile(
            leading: Icon(
              Icons.person_add_alt_1_sharp,
            ),
            title: const Text('Edit Profile',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 15),),
            onTap: () {
              Get.back();
              Get.toNamed(RouteHelper.Edit_Profile);
            },
          ),
        ),
        Card(
          elevation: 2,
          shadowColor: Colors.grey.shade600,
          child: ListTile(
            leading: Icon(
              Icons.phone,
            ),
            title: const Text('Support',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 15)),
            onTap: () async {
              Get.back();
            },
          ),
        ),Card(
          elevation: 2,
          shadowColor: Colors.grey.shade600,
          child: ListTile(
            leading: Icon(
              Icons.output,
            ),
            title: const Text('Log Out',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 15)),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              SharedPreferenceClass.SetSharedData(AppContent.LOGSTATUS, "false");
              Get.offAllNamed(RouteHelper.Login);
            },
          ),
        ),
      ],
    ),
    ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectindex, //New
        onTap: _onItemTapped,
        selectedFontSize: 12,
        selectedIconTheme: IconThemeData(color: Colors.black87, size: 20),
        selectedItemColor: Colors.black87 ,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700,fontSize: 13,color: Colors.black87),
      unselectedFontSize: 11,
      unselectedLabelStyle: TextStyle(fontSize: 12,color: Colors.black87),
      unselectedItemColor: Colors.black54,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 3.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.circle,color:_selectindex==0?AppColor.buttonblue:Color(0XffD9D9D9)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle,color: _selectindex==1?AppColor.buttonblue:Color(0XffD9D9D9)),
            label: 'Career',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle,color: _selectindex==2?AppColor.buttonblue:Color(0XffD9D9D9)),
            label: 'Api test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle,color: _selectindex==3?AppColor.buttonblue:Color(0XffD9D9D9)),
            label: 'MCC',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle,color: _selectindex==4?AppColor.buttonblue:Color(0XffD9D9D9)),
            label: 'MSM',

          ),

        ],
      ),
      body:_pages[_selectindex],
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectindex = index;
    });
  }
}
