
import 'package:career_map/helper/AppColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Textfield extends StatelessWidget {
  TextEditingController contrl=TextEditingController();
  String label;bool show=false;String message;

  Textfield({required this.contrl, required this.label,required this.show,required this.message});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contrl,
      decoration: InputDecoration(
        // enabled: false,
          label: Text("$label",),
          contentPadding: EdgeInsets.only(left: 10,top: 10,right: 15),
         /* disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.black26)
          ),
          enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.black26)
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.black26)
          ),*/
          suffix: InkWell(
              onTap: (){
                //Get.toNamed(RouteHelper.getsearch_State_Elc());
              },
              child:show? Text("Change",style: TextStyle(color: Colors.blueAccent,fontSize: 12,fontWeight: FontWeight.w500),):Text(""))
      ),
      validator: (val) {
        if (val!.isNotEmpty) {
          return "$message";
        } else {
          return null;
        }
      }
      );
  }
}

class Mobiletext_field extends StatelessWidget {
  TextEditingController contrl=TextEditingController();
  String label;bool show=false;String route;String validation="";
  int numberlength=0;

  Mobiletext_field({required this.contrl, required this.label,required this.show,required this.route,required this.validation,required this.numberlength});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contrl,
       inputFormatters: [LengthLimitingTextInputFormatter(numberlength)],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        // enabled: false,
          label: Text("$label",),
          contentPadding: EdgeInsets.only(left: 10,top: 10,right: 15),
          /*disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.black26)
          ),
          enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.black26)
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.black26)
          ),*/
          suffix: InkWell(
              onTap: (){
                //Get.toNamed(RouteHelper.getsearch_State_Elc());
              },
              child:show? Text("Change",style: TextStyle(color: Colors.blueAccent,fontSize: 12,fontWeight: FontWeight.w500),):Text(""))
      ),
      validator: (val){
        if(val!.isNotEmpty){
          return "$validation";
        }else{
          return null;
        }
      },
    );
  }
}

class Textfield_Round extends StatelessWidget {

  TextEditingController contrl=TextEditingController();
  String label; TextInputType? keyboardType;
  Textfield_Round({required this.contrl, required this.label,this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contrl,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        // enabled: false,
        hintText: label,
          // /label: Text("$label",),
          fillColor: Colors.grey.shade300,
          focusColor: Colors.grey.shade300,
          hoverColor:Colors.grey.shade300,
          contentPadding: EdgeInsets.only(left: 15,top: 10,right: 15),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color:Colors.grey.shade500)
          ),
          enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color:Colors.grey.shade500)
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color:Colors.grey.shade500)
          ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color:Colors.grey.shade500)
        ),
      ),
      validator: (val){
        if(val!.isNotEmpty){
          return "fill the $label";
        }else{
          return null;
        }
      },
    );
  }
}
class Button2 extends StatelessWidget {
  String name='';
  double height=0.0;
  double width=0.0;
  double radius=25;
  EdgeInsetsGeometry? margin;

  Button2(this.name, this.height, this.width, this.margin,this.radius);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin:margin,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
            colors: [AppColor.buttonblue,Colors.black87],
          //begin: Alignment(5, 5),
          end: Alignment(5, 0.5)
        )
      ),
      child: Center(child: Text("$name",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 0.2),)),
    );
  }
}
class Button3 extends StatelessWidget {
  String name='';
  double height=0.0;
  double width=0.0;
  double radius=25;
  EdgeInsetsGeometry? margin;

  Button3(this.name, this.height, this.width, this.margin,this.radius);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin:margin,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: LinearGradient(
              colors: [Colors.green,Colors.black87],
              //begin: Alignment(5, 5),
              end: Alignment(5, 0.5)
          )
      ),
      child: Center(child: Text("$name",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 0.2),)),
    );
  }
}


