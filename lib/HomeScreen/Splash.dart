import 'package:career_map/base/AppContent.dart';
import 'package:career_map/base/Perferance.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/route_helper.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

 @override
  void initState() {
   getdata();
    super.initState();
  }
  getdata() async {
    /*FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        Get.offAllNamed(RouteHelper.Login);
      } else {
        Get.offAllNamed(RouteHelper.BottomNavScreen);
        print('User is signed in!');
      }
    });*/
    String login=await SharedPreferenceClass.GetSharedData(AppContent.LOGSTATUS).toString();
    if(login=="true"){
      Get.offAllNamed(RouteHelper.BottomNavScreen);
    }else{
      Get.offAllNamed(RouteHelper.Login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("asset/logo.png"),
      ),
    );
  }
}
