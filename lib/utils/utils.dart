import 'package:flutter/material.dart';

class utils {
  //Size getScreenSize(BuildContext context) {
   // Size size = MediaQueryData.fromView(View.of(context)).size.width;
    // MediaQueryData.fromView(
    //  WidgetsBinding.instance.platformDispatcher.views.single);
   // return size;
  //}
  showSnackBar({required BuildContext context,required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.orange,
        shape:const RoundedRectangleBorder(
          borderRadius:BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            ),
         ),
        content:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(content),
          ],
        ),
        ),
        );
  }
}
