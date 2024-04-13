import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/AppColor.dart';

import '../helper/Textfield.dart';
import '../helper/message.dart';
import '../helper/route_helper.dart';

class Register_Screen extends StatefulWidget {
   Register_Screen({Key? key}) : super(key: key);

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  TextEditingController Name=TextEditingController();
  TextEditingController Email=TextEditingController();
  TextEditingController Password=TextEditingController();
  TextEditingController Contact=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool click=false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height:height,
        width: width,
        decoration: BoxDecoration(
          // color: Colors.redAccent,
            image: DecorationImage(
                image: AssetImage("asset/login_background.png"),
                fit: BoxFit.fill
            )
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: height*0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    //  color: Color(0XffD9D9D9),
                        color: Colors.grey.shade200
                    ),
                    margin: EdgeInsets.only(left: 15,right: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("Welcome",style: TextStyle(fontSize: 15,color: Colors.black87,fontWeight: FontWeight.w800,),),
                      Textfield(contrl: Name, label: "Name", show: false, message: "enter name"),
                      Textfield(contrl: Email, label: "Email", show: false, message: "enter Email"),
                      Textfield(contrl: Password, label: "Password", show: false, message: "enter password"),
                      Mobiletext_field(contrl: Contact, label: "Contact number", show: false, route: "", validation: "enter Contact",numberlength: 10),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height:55,
                    width: width*0.35,
                    margin: EdgeInsets.only(top: height*0.5),
                    child: InkWell(
                      onTap: (){
                       /* if(_formKey.currentState!.validate()){

                        }*/
                        click=true;
                        setState(() {
                        });
                        regiater();
                      },
                      child: click?Center(child: CircularProgressIndicator(color: AppColor.buttonblue),):Button2("Sign Up",50,width*0.3,EdgeInsets.only(left: 10,right: 10,top: 10),10,),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15,),
              InkWell(
                  onTap: (){
                    Get.toNamed(RouteHelper.Login);
                  },
                  child: Text("Login", style: TextStyle(fontSize: 14,color:AppColor.buttonblue,fontWeight: FontWeight.w500,),)),

            ],
          ),
        ),
      ),
    );
  }
  Future<void> regiater() async {
    User? user;
    var data={
      "name": Name.text.toString(),
      "email": Email.text.toString(),
      "contact":Contact.text.toString(),
      "collagename":"",
      "city":"",
      "Description":"",
    };
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Email.text,
        password: Password.text,
      );
      print('USer'+credential.user!.uid);

      if(credential !=null){
        user=credential.user;
       await user!.sendEmailVerification();
        await FirebaseFirestore.instance.collection("User").doc(Email.text).set(data).then((value){
          print("Done");
          Get.toNamed(RouteHelper.Login);
          showCustomSnackBar(message: "Register successfully\n Please check mail and verify it", context: context);
        });
      }
      click=false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        showCustomSnackBar(message: "${e.code}", context: context);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        showCustomSnackBar(message: "${e.code}", context: context);
      }
      click=false;
      setState(() {
      });
    } catch (e) {
      click=false;
      setState(() {
      });
      showCustomSnackBar(message: "${e}", context: context);
      print("Excep"+e.toString());
    }


  }
}
