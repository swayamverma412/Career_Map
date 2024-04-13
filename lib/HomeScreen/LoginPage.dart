import 'package:career_map/base/AppContent.dart';
import 'package:career_map/base/Perferance.dart';
import 'package:career_map/helper/AppColor.dart';
import 'package:career_map/helper/Textfield.dart';
import 'package:career_map/helper/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/route_helper.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  TextEditingController Email=TextEditingController();
  TextEditingController Password=TextEditingController();
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
                    height: height*0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: Color(0XffD9D9D9),
                      color: Colors.grey.shade200
                    ),
                    margin: EdgeInsets.only(left: 15,right: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome",style: TextStyle(fontSize: 15,color: Colors.black87,fontWeight: FontWeight.w800,),),
                          SizedBox(height: 10,),
                       Textfield(contrl: Email, label: "Email", show: false, message: "enter Email"),
                          SizedBox(height: 10,),
                          Textfield(contrl: Password, label: "Password", show: false, message: "enter password"),
                          SizedBox(height: 10,),
                          Align(alignment:Alignment.centerRight,child: Text("Forget ?", style: TextStyle(fontSize: 13,color:AppColor.buttonblue,fontWeight: FontWeight.w500,),)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height:50,
                    width: width*0.3,
                    margin: EdgeInsets.only(top: height*0.33),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          click=true;
                        });
                        Login();

                      },
                      child: click?Center(child: CircularProgressIndicator(color: AppColor.buttonblue,)):Button2("Login",50,width*0.3,EdgeInsets.only(left: 10,right: 10,top: 10),10,),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15,),
              InkWell(
                onTap: (){
                  Get.toNamed(RouteHelper.RegisterScreen);
                },
                  child: Text("Register", style: TextStyle(fontSize: 14,color:AppColor.buttonblue,fontWeight: FontWeight.w500,),)),

            ],
          ),
        ),
      ),
    );
  }
  Future<void> Login()async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: Email.text,
          password: Password.text
      );
      print("User"+credential.toString());
      setState(() {
      });
      if(credential != null){
        if(credential.user!.emailVerified==true) {
          SharedPreferenceClass.SetSharedData(AppContent.USERNAME, credential.user!.displayName);
          SharedPreferenceClass.SetSharedData(AppContent.EMAIL, credential.user!.email);
          SharedPreferenceClass.SetSharedData(AppContent.LOGSTATUS, "true");
          Get.toNamed(RouteHelper.BottomNavScreen);
          showCustomSnackBar(message: "Login Success", context: context);
        }else{
          Get.offAllNamed(RouteHelper.Login);
          showCustomSnackBar(message: "Please verify email", context: context);
        }
      }else{
        showCustomSnackBar(message: "${"Try Again"}", context: context);
      }
      click=false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        click=false;
        showCustomSnackBar(message: "${e.code}", context: context);
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        click=false;
        showCustomSnackBar(message: "${e.code}", context: context);
        print('Wrong password provided for that user.');
      }
      setState(() {
      });
    }catch(e){
      showCustomSnackBar(message: "${e.toString()}", context: context);
    }
    setState(() {
    });
  }
}
