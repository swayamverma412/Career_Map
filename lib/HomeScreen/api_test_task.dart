import 'package:career_map/helper/route_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/Textfield.dart';

class ApiTestTask extends StatefulWidget {
  const ApiTestTask({Key? key}) : super(key: key);

  @override
  State<ApiTestTask> createState() => _ApiTestTaskState();
}

class _ApiTestTaskState extends State<ApiTestTask> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
     appBar: AppBar(
       leading: IconButton(
         icon: Icon(Icons.arrow_back, color: Colors.black),
         onPressed: () => Navigator.of(context).pop(),
       ),
       backgroundColor: Colors.white,
       centerTitle: true,
       elevation: 3,
       shadowColor: Colors.grey.shade500,
       title: Text("Test",style: TextStyle(color: Colors.black),),
     actions: [
       Padding(
         padding: const EdgeInsets.all(10.0),
         child: CircleAvatar(
           backgroundImage: AssetImage("asset/profile_demo.png"),
         ),
       )
     ],
     ),
     body: Column(
       children: [
         SizedBox(height: 10,),
         cardWidget("Aptitude Test", 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
         cardWidget("Personality Test", 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
         cardWidget("Intelligence Test", 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),

       ],
     ),
      bottomSheet: InkWell(
        onTap: (){
          //    Get.toNamed(RouteHelper.ApiTest_Task);
        },
        child: Button2("Result", 50,size.width, EdgeInsets.only(left: 10,right: 10,bottom: 10),13),
      ),
   );
  }

  Widget cardWidget(String name,desc) {
    return Card(
      child: ExpansionTile(
        title: Text(
         name,
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500,color: Colors.black87),
        ),
        children: <Widget>[
          ListTile(
            title: Text(
              desc,
              style: TextStyle(fontSize:12,fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
