import 'package:career_map/HomeScreen/LoginPage.dart';
import 'package:career_map/helper/AppColor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helper/route_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: RouteHelper.getSplash(),
      getPages: RouteHelper.routes,
      defaultTransition: Transition.topLevel,
      theme: ThemeData(
        primaryColor: AppColor.buttonblue
      ),
      transitionDuration: Duration(milliseconds: 500),
    );
  }
}