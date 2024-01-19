import 'package:amazon_clone/model/user_details_model.dart';
import 'package:amazon_clone/resources/cloudfirestore_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationMethods{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CloudFireStoreClass cloudFireStoreClass = CloudFireStoreClass();
  // ignore: non_constant_identifier_names
  Future<String> signUpUser({required String name,required String address,required String email,required String Password}) async{
    name.trim();
    address.trim();
    email.trim();
    Password.trim();
    String output = "Something went wrong";
    if(name!=""&& address!=""&& email!=""&& Password!=""){
      try{
        await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: Password);
          UserDetailsModel user = UserDetailsModel(name: name, address: address);
          await cloudFireStoreClass.uploadNameAndAddressTODatabase(
            user : user);
        output = "success";
      }on FirebaseAuthException catch (e){
        output = e.message.toString();
      }
    }else{
      output = "please fill up all the fields";
      }
      return output;
      }

      Future<String> signInUser(
        {
          //required String name,
          //required String address,
        required String email,
        required String Password}) async{
          //name.trim();
          //address.trim();
    email.trim();
    Password.trim();
    String output = "Something went wrong";
    if( email!=""&& Password!=""){
      try{
        await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: Password);
        output = "success";
      }on FirebaseAuthException catch (e){
        output = e.message.toString();
      }
    }else{
      output = "please fill up all the fields";
      }
      return output;
      }
    }
