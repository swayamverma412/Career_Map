import 'package:career_map/helper/Textfield.dart';
import 'package:career_map/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Carrer_Details extends StatefulWidget {
  String image,Details;


  Carrer_Details({required this.image, required this.Details});

  @override
  State<Carrer_Details> createState() => _Carrer_DetailsState();
}

class _Carrer_DetailsState extends State<Carrer_Details> {
  var arg;
  @override
  void initState() {
     arg=Get.arguments;
     setState(() {
     });
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
        title: Text("Carrier Details",style: TextStyle(color:Colors.black87,fontSize: 15,fontWeight: FontWeight.bold,letterSpacing: 0.3)),
      ),
      bottomSheet: InkWell(
        onTap: (){
          Get.toNamed(RouteHelper.Carrierregister);
        },
        child: Button2("Register", 50, width, EdgeInsets.only(left: 10,right: 10,bottom: 10),15),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
            Container(
            height:height*0.3,
            width: width,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(arg["image"].toString()),
                )
            ),
          ),
              SizedBox(height: 20,),
              Text("About us",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w800,letterSpacing: 0.3),),
              SizedBox(height: 10,),
              Text("${arg["deatils"]}",
                overflow: TextOverflow.visible,maxLines: 7,style: TextStyle(color: Colors.black87.withOpacity(0.7),fontSize: 11,fontWeight: FontWeight.w600,letterSpacing: 0.1),),
              SizedBox(height: 20,),
              Text(".${arg["deatils"]}",
                overflow: TextOverflow.visible,maxLines: 7,style: TextStyle(color: Colors.black87.withOpacity(0.7),fontSize: 11,fontWeight: FontWeight.w600,letterSpacing: 0.1),),
              SizedBox(height: 5,),
              Text(". lLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore",
                overflow: TextOverflow.visible,maxLines: 7,style: TextStyle(color: Colors.black87.withOpacity(0.7),fontSize: 11,fontWeight: FontWeight.w600,letterSpacing: 0.1),),
              SizedBox(height: 5,),
              Text(". lLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore",
                overflow: TextOverflow.visible,maxLines: 7,style: TextStyle(color: Colors.black87.withOpacity(0.7),fontSize: 11,fontWeight: FontWeight.w600,letterSpacing: 0.1),),
            ],
          ),
        ),
      ),
    );
  }
}
