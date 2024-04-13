import 'package:career_map/helper/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFuncation{
  Future<List?> getCollection(String name) async {
    var querySnapshot= await FirebaseFirestore.instance.collection('$name').get();
    if (querySnapshot.docs.isNotEmpty) {
      print('Collection dat'+ querySnapshot.docs.toList().toString());
     return querySnapshot.docs.toList();
    } else {
      print(querySnapshot.docs.length);
      print('No documents found in the collection.');
      return [];
    }
  }
  Future<dynamic> getCollectionwith_id(String name,String id) async {
  CollectionReference event = FirebaseFirestore.instance.collection('${name}');
  var data=await event.doc('$id').get();
  return data.data();
  }
  Future<void> updateCollectionwith_id(String name,String id,Map<String,String> updt) async {
    CollectionReference event = await FirebaseFirestore.instance.collection('${name}');
     await event.doc('$id').update(updt);
  }

}
 class Event{
  String name;
  String imagel;
  String url;

  Event(this.name, this.imagel, this.url);
}
class carrier{
  String name;
  String imagel;
  String Details;

  carrier(this.name, this.imagel, this.Details);
}