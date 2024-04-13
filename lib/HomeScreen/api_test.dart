
import 'package:career_map/helper/Textfield.dart';
import 'package:career_map/helper/route_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';

class ApiTest extends StatefulWidget {
  const ApiTest({Key? key}) : super(key: key);

  @override
  State<ApiTest> createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {

  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left:20.0,right: 20,top: 12),
        child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (BuildContext context,int position){
              return ApiWidget(sizeQuery,position);
            }),
      ),
    );

  }

  Widget ApiWidget( Size size,int position) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text("CAREER COUNSELING (LIMITED)",style: TextStyle(fontSize: 18,color: Colors.black87,fontWeight: FontWeight.w800,),),
        SizedBox(height: 10,),
        Stack(children: [
          Container(
            height: 220,
            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage("asset/profile_demo.png"),
                    fit: BoxFit.fill
                )
            ),
          ),
          InkWell(
            onTap: (){
              Get.toNamed(RouteHelper.ApiPayment);
            },
              child: Button2("Register Now",50,size.width,EdgeInsets.only(left: 10,right: 10,top: size.height*0.3),10,))
        ]),
        SizedBox(height: 10,),
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.w800,),),
      ]),
    );

  }
}
