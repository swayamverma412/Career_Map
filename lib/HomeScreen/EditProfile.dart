import 'package:career_map/base/FirebaseFuncation.dart';
import 'package:career_map/helper/AppColor.dart';
import 'package:career_map/helper/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/AppContent.dart';
import '../base/Perferance.dart';
import '../helper/Textfield.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController Name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController Contact=TextEditingController();
  TextEditingController Collagename=TextEditingController();
  TextEditingController City=TextEditingController();
  TextEditingController Desc=TextEditingController();
  final GlobalKey _form=GlobalKey<FormState>();
  String emai="";
  bool update=false,click=false;
  @override
  void initState() {
    getprofile();
    super.initState();
  }
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
        title: Text("Edit Profile",style: TextStyle(color:Colors.black87,fontSize: 15,fontWeight: FontWeight.bold,letterSpacing: 0.3)),
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
                  },
                  child: Button2("Remove Account", 50, width, EdgeInsets.only(left: 10,right: 10,bottom: 10),13),
                ),
                SizedBox(height: 15,),
                click?Center(child: CircularProgressIndicator(color: AppColor.buttonblue),):  InkWell(
                  onTap: (){
                    setState(() {
                      click=true;
                    });
                    Updateprofile();
                   // if(_form.currentState.v)
                  },
                  child:Button3("Save Changes", 50, width, EdgeInsets.only(left: 10,right: 10,bottom: 10),13),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> getprofile()async{
   emai=await SharedPreferenceClass.GetSharedData(AppContent.EMAIL);
    var pro=await FirebaseFuncation().getCollectionwith_id("User", emai);
    print(pro.toString());
    if(pro !=null){
      Name.text=pro["name"];
      email.text=pro["email"];
      Contact.text=pro["contact"];
      if(pro["collagename"].toString().isNotEmpty){
        Collagename.text=pro["collagename"];
        City.text=pro["city"];
        Desc.text=pro["Description"];

      }
    }
    setState(() {
    });
  }
  Future<void> Updateprofile()async{
    var data={
      "name": Name.text.toString(),
      "contact":Contact.text.toString(),
      "collagename":Collagename.text.toString(),
      "city":City.text.toString(),
      "Description":Desc.text.toString(),
    };
    print(data.toString());
    await FirebaseFuncation().updateCollectionwith_id("User",emai.toString(), data).whenComplete((){
      Get.back();
      showCustomSnackBar(message: "Successfully update", context: context);
    });
  }
}
