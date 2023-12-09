import 'package:amazon_clone/model/user_details_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';

class CloudFireStoreClass{
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future uploadManeAndAddressTODatabase(
    {required UserDetailsModel user}) async{
      await firebaseFirestore
      .collection("users")
      .doc(firebaseAuth.currentUser!.uid)
      .set(user.getJson());
    }
}