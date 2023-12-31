import 'package:amazon_clone/firebase_options.dart';
import 'package:amazon_clone/layout/screen_layout.dart';
import 'package:amazon_clone/screens/sign_in_screen.dart';
import 'package:amazon_clone/utils/color_theams.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    
  options: DefaultFirebaseOptions.currentPlatform,
);
  
  runApp(const AmazonClone());
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Amazon Clone",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home:StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
         builder:(context,AsyncSnapshot<User?>user){
          if(user.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(
                color:Colors.orange,
                ),
                );
          }else if(user.hasData){
            return const ScreenLayout();
          }else{
            return const SignInScreen();
          }
         }
         ),
    );
  }
}
