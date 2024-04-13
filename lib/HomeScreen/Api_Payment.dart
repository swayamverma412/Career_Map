import 'package:career_map/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/Textfield.dart';

class Api_Payment extends StatefulWidget {
  const Api_Payment({Key? key}) : super(key: key);

  @override
  State<Api_Payment> createState() => _Api_PaymentState();
}

class _Api_PaymentState extends State<Api_Payment> {
  TextEditingController Name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController Contact=TextEditingController();
  TextEditingController Collagename=TextEditingController();
  TextEditingController City=TextEditingController();
  TextEditingController Desc=TextEditingController();
  final GlobalKey _form=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        shadowColor: Colors.grey.shade500,
        title: Text("Register",style: TextStyle(color:Colors.black87,fontSize: 15,fontWeight: FontWeight.bold,letterSpacing: 0.3)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                CircleAvatar(
                  backgroundImage:AssetImage("asset/profile_demo.png"),
                  radius: 30,
                ),
                SizedBox(height: 20,),
                Textfield_Round(contrl: Name, label: "name"),
                SizedBox(height: 15,),
                Textfield_Round(contrl: email, label: "email"),
                SizedBox(height: 15,),
                Textfield_Round(contrl: Contact, label: "Contact no",keyboardType: TextInputType.number),
                SizedBox(height: 15,),
                Textfield_Round(contrl: Collagename, label: "Collage name",),
                SizedBox(height: 15,),
                Textfield_Round(contrl: City, label: "City",),
                SizedBox(height: 15,),
                Textfield_Round(contrl: Desc, label: "Description",),
                SizedBox(height: 25,),
                InkWell(
                  onTap: (){
                    Get.toNamed(RouteHelper.ApiTest_Task);
                  },
                  child: Button2("PayNow", 50, width, EdgeInsets.only(left: 10,right: 10,bottom: 10),13),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  }
