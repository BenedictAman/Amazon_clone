import 'package:amazon_clone/resources/authentication_methods.dart';
import 'package:amazon_clone/screens/sign_up_screen.dart';
import 'package:amazon_clone/utils/color_theams.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/text_field_widget.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    emailControler.dispose();
    PasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    // utils().getScreenSize;
    //MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      amazonLogo,
                      height: screenSize.height * 0.10,
                    ),
                    Container(
                      height: screenSize.height * 0.6,
                      width: screenSize.width * 0.8,
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Sign-In",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 33),
                          ),
                          TextFieldWidget(
                            title: "Email",
                            controller: emailControler,
                            obscureText: false,
                            hintText: "Enter your email",
                          ),
                          TextFieldWidget(
                            title: "Password",
                            controller: PasswordController,
                            obscureText: true,
                            hintText: "Enter your Password",
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: CustomMainButton(
                              color: yellowColor,
                              isLoading: isLoading,
                              onPressed: ()async {
                                setState(() {
                                  isLoading = true;
                                });
                               // Future.delayed(const Duration(seconds: 1));
                                String output =  await
                                authenticationMethods.signInUser(
                                  email: emailControler.text,
                                   Password: PasswordController.text,
                                   );
                                   setState(() {
                                     isLoading = false;
                                   });
                                   if(output=="success"){
                                    //functions
                                   }else{
                                    //error
                                    utils().showSnackBar(
                                      context: context,
                                       content: output
                                       );
                                   }
                              },
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                    letterSpacing: 0.6, color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "New to Amazon?",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    CustomMainButton(
                      color: Colors.grey[400]!,
                      isLoading: false,
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignUpScreen();
                        }));
                      },
                      child: const Text(
                        "Create an Amazon Account",
                        style:
                            TextStyle(letterSpacing: 0.6, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
