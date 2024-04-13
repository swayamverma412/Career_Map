import 'package:career_map/helper/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/FirebaseFuncation.dart';
import '../../helper/Textfield.dart';
import '../../helper/route_helper.dart';

class Mcc_page extends StatefulWidget {
  const Mcc_page({Key? key}) : super(key: key);

  @override
  State<Mcc_page> createState() => _Mcc_pageState();
}

class _Mcc_pageState extends State<Mcc_page> {
  List mcc=[];

  @override
  void initState() {
    getevent();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomSheet: InkWell(
        onTap: (){
          Get.toNamed(RouteHelper.Carrierregister);
        },
        child: Button2("Register", 50, width, EdgeInsets.only(left: 10,right: 10,bottom: 10),15),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: mcc.length==0?Center(child: CircularProgressIndicator(color: AppColor.buttonblue),):Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Container(
                height:height*0.3,
                width: width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(mcc[0]["image"].toString()),
                    )
                ),
              ),
              SizedBox(height: 20,),
              Text("About us",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w800,letterSpacing: 0.3),),
              SizedBox(height: 10,),
              Text(mcc[0]["Details"].toString(),
                overflow: TextOverflow.visible,maxLines: 7,style: TextStyle(color: Colors.black87.withOpacity(0.7),fontSize: 11,fontWeight: FontWeight.w600,letterSpacing: 0.1),),
              SizedBox(height: 20,),
              Text(". ${mcc[0]["Details"].toString()}",
                overflow: TextOverflow.visible,maxLines: 7,style: TextStyle(color: Colors.black87.withOpacity(0.7),fontSize: 11,fontWeight: FontWeight.w600,letterSpacing: 0.1),),
              SizedBox(height: 5,),
              Text(". lLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore",
                overflow: TextOverflow.visible,maxLines: 7,style: TextStyle(color: Colors.black87.withOpacity(0.7),fontSize: 11,fontWeight: FontWeight.w600,letterSpacing: 0.1),),
              SizedBox(height: 5,),
              Text(". lLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore",
                overflow: TextOverflow.visible,maxLines: 7,style: TextStyle(color: Colors.black87.withOpacity(0.7),fontSize: 11,fontWeight: FontWeight.w600,letterSpacing: 0.1),),
              SizedBox(height: 70,)
            ],
          ),
        ),
      ),
    );
  }
  Future<void> getevent() async {
    var even= await FirebaseFuncation().getCollection("Mcc");
    even!.forEach((element) {
      print(element.data().toString());
      mcc.add(element.data());
    });
    setState(() {
    });
  }
}
