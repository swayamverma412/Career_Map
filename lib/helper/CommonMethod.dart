/*
 import 'package:image_picker/image_picker.dart';
 import 'package:permission_handler/permission_handler.dart';

class Commonmenthod{

  static Future<XFile> getImage() async {
    var image;
    if(await Permission.storage.isGranted){
      image=await ImagePicker.platform.getImage(source: ImageSource.gallery);
    }else{
      await Permission.storage.request().then((value) => getImage());
    }
    return image!;
  }
 }*/
