import 'package:career_map/helper/AppColor.dart';
import 'package:career_map/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/FirebaseFuncation.dart';

class Carrer_option extends StatefulWidget {
  const Carrer_option({Key? key}) : super(key: key);

  @override
  State<Carrer_option> createState() => _Carrer_optionState();
}

class _Carrer_optionState extends State<Carrer_option> {
  TextEditingController contrl=TextEditingController();
  List<carrier> carrierList=[];

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
            controller: contrl,
            decoration: InputDecoration(
              // enabled: false,
                label: Text("Search"),
                contentPadding: EdgeInsets.only(left: 10,top: 10,right: 15),
                disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.black26)
            ),
            enabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.black26)
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.black26)
            ),
                suffix: Icon(Icons.search,color: Colors.black87,),
            ),
        ),
          ),
            carrierList.length==0?Center(child: CircularProgressIndicator(color: AppColor.buttonblue),):ListView.builder(
              itemCount: carrierList.length,
                shrinkWrap: true,
                primary: false,
              //  padding: EdgeInsets.only(top: 10),
                itemBuilder: (BuildContext Context,int ind){
              return InkWell(
                onTap: (){
                  Map<String, dynamic> parameter = {
                    'image': carrierList[ind].imagel.toString(),
                    'deatils':carrierList[ind].Details.toString(),

                  };
                  Get.toNamed(RouteHelper.CarrerDetails,arguments:parameter);
                },
                child: Container(
                  height:height*0.3,
                  width: width,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(carrierList[ind].imagel.toString()),
                    )
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
  Future<void> getevent() async {
    var even= await FirebaseFuncation().getCollection("CarrerOption");
    even!.forEach((element) {
      print(element.data().toString());
      carrierList.add(carrier("", element.data()['banner'].toString(), element.data()['Details'].toString()));
    });
    setState(() {
    });
    print(carrierList.toString());
  }
}
