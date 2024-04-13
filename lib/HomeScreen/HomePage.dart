import 'dart:convert';

import 'package:career_map/base/AppContent.dart';
import 'package:career_map/base/FirebaseFuncation.dart';
import 'package:career_map/base/Perferance.dart';
import 'package:career_map/helper/AppColor.dart';
import 'package:career_map/helper/route_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  String name="Hello Swayam !";
  List image=[];
  List<Event> event=[];
var profile;
  @override
  void initState() {
    // TODO: implement initState
    getbanner();
    getevent();
    getprofile();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        primary: true,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10,10, 10, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start  ,
                      children: [
                        Text(name,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.black87,letterSpacing: 0.3),),
                        SizedBox(height: 5,),
                        Text("Good evening",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color:AppColor.buttonblue,letterSpacing: 0.3),)
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.toNamed(RouteHelper.Edit_Profile);
                    },
                    child: Container(
                      height:height*0.15,
                      width:width*0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("asset/profile_demo.png"),
                          fit: BoxFit.fill
                        )
                      ),
                    ),
                  )
                ],
              ),
            SizedBox(height: 20,),
              image.length==0?Container(): CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2.0,
                viewportFraction:0.93,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
                
              ),
              items: image.map((e){
                return Container(
                  height: height*0.2,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(e.toString()),
                      fit: BoxFit.fill
                    )
                  ),
                );
              }).toList(),
            ),
              SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width*0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("About us",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w800,letterSpacing: 0.3),),
                       SizedBox(height: 5,),
                        Text("lLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore",overflow: TextOverflow.visible,maxLines: 7,style: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.w600,letterSpacing: 0.1),),
                      ],
                    ),
                  ),
                     Container(
                      height:height*0.2,
                      width:width*0.3,
                      decoration: BoxDecoration(
                        //color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("asset/feed_logo2.png"),
                              fit: BoxFit.contain
                          )
                      ),
                    ),
                ],
              ),
              SizedBox(height: 3,),
              Text("Upcoming live Session",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w800,letterSpacing: 0.3),),
              SizedBox(height: 15,),
          SizedBox(
            height: 75,
            child: event.length==0?Center(child: CircularProgressIndicator(),):ListView.builder(
                itemCount: event.length,
                shrinkWrap: true,
                primary: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context,int index){
                  return InkWell(
                    onTap: () async {
                      final url = event[index].url.toString();
                      if(await canLaunch(url)){
                      await launch(url);
                      }else {
                      throw 'Could not launch $url';
                      }
                    },
                    child: Container(
                      height: 100,
                      width: 90,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: NetworkImage(event[index].imagel.toString()),
                              fit: BoxFit.fill
                          )
                      ),
                    ),
                  );
                }),
          ),
              SizedBox(height: 10,),
              Text("Pool Of Counselor",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w800,letterSpacing: 0.3),),
              SizedBox(height: 15,),
              SizedBox(
                height: 75,
                child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    primary: true,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context,int index){
                      return Container(
                        height: 90,
                        width: 90,
                        margin: EdgeInsets.only(right: 7),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("asset/profile_demo.png"),
                              fit: BoxFit.fill
                              //  fit: BoxFit.fill
                            )
                        ),
                      );
                    }),
              ),
              SizedBox(height: 30,),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () async {
                    final url = "https://aitoolsdirectory.com";
                    if(await canLaunch(url)){
                    await launch(url);
                    }else {
                    throw 'Could not launch $url';
                    }
                  },
                  child: Container(
                    height: 50,
                    width: width*0.8,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("asset/feed_blog_button.png"),
                        fit: BoxFit.fill,
                      )
                    ),
                    child: Center(child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text("Blog & Feed",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w800),),
                    )),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () async {
                    final url = "https://aitoolsdirectory.com";
                    if(await canLaunch(url)){
                      await launch(url);
                    }else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Container(
                    height: height*0.2,
                    width: width*0.8,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("asset/feed_contact.png"),
                          fit: BoxFit.fill,
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> getbanner() async {
   var banner= await FirebaseFuncation().getCollection("banner");
   banner!.forEach((element) {
     print(element["image"]);
     image.add(element["image"]);
   });
   setState(() {
   });
    print("baner");
  }
  Future<void> getevent() async {
    /*CollectionReference event = FirebaseFirestore.instance.collection('Events');
    var id=await event.get();*/
   /* id.docs.toList().forEach((element) {
      print(element.data().toString());
    });*/
    var even= await FirebaseFuncation().getCollection("Events");
    even!.forEach((element) {
      print(element.data().toString());
      event.add(Event("", element.data()['ThumbnailPoster'].toString(), element.data()['url'].toString()));
    });
    setState(() {
    });
    print(event.toString());
  }
  Future<void> getprofile()async{
    String email=await SharedPreferenceClass.GetSharedData(AppContent.EMAIL);
    CollectionReference event = FirebaseFirestore.instance.collection('User');
    var id=await event.doc('$email').get();
    print("Emial"+id.data().toString());
    setState(() {
      profile=id.data();
      name="Hello "+profile["name"].toString();
    });
  }
}
