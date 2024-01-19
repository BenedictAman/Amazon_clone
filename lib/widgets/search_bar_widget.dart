import 'package:amazon_clone/screens/results_screen.dart';
import 'package:amazon_clone/screens/search_screen.dart';
import 'package:amazon_clone/utils/color_theams.dart';
import 'package:amazon_clone/utils/constants.dart';
//import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class SearchBarWidget extends StatelessWidget implements PreferredSizeWidget {
final bool isReadonly;
final bool hasBackButton;

@override
  Size get preferredSize => const Size.fromHeight(kAppBarHeight);

  SearchBarWidget({super.key,
  PreferredSize,
  required this.isReadonly,
  required this.hasBackButton,
  }); 

  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: const BorderSide(color: Colors.grey,
    width: 1,
    ),
    );

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: kAppBarHeight,
      decoration:const BoxDecoration(
        gradient:LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight
          ), 
          ),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children: [
              hasBackButton
              ? IconButton(
                onPressed: (){
                  Navigator.pop(context);
                }, icon:const Icon(Icons.arrow_back)) 
              : Container(),
              SizedBox(
                width: screenSize.width * 0.7,
                child:Container(
                  decoration: BoxDecoration(
                    boxShadow:[
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset:const Offset(0, 5),
                        ),
                        ], 
                        ),
                  child: TextField(
                    onSubmitted: (String query){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsScreen(query: query,
                      ),
                      ),
                      );
                    },
                    readOnly: isReadonly,
                    onTap: (){
                      if(isReadonly){
                        Navigator.push(
                          context,
                           MaterialPageRoute(
                            builder:(context)=>const SearchScrren(),
                            ),
                            );
                      }
                    },
                    decoration:InputDecoration(
                      hintText:"Search for some thing in amazon",
                      fillColor:Colors.white,
                      filled: true,
                      border:border,
                      focusedBorder: border,
                    ),
                  ),
                ),
                ),
                IconButton(
                  onPressed: (){},
                   icon: const Icon(Icons.mic_none_outlined),
                   ),
            ],
            ),
    );
  }
  
  
  
}
