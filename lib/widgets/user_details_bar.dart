import 'package:amazon_clone/model/user_details_model.dart';
import 'package:amazon_clone/providers/user_details_provider.dart';
import 'package:amazon_clone/utils/color_theams.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetailsBar extends StatelessWidget {
  final double offeset;
  //final UserDetailsModel userDetails;
  const UserDetailsBar({
    Key?key,
    required this.offeset,
    //required this.userDetails,
    }): super(key:key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    UserDetailsModel userDetails= Provider.of<UserDetailsProvider>(context).userDetails;
    return Positioned(
      top: -offeset/3,
      child: Container(
        height: kAppBarHeight/2,
        width: screenSize.width,
        decoration:const BoxDecoration(
          gradient: LinearGradient(
            colors:lightBackgroundaGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            ),
            ) ,
            child: Padding(
              padding:const  EdgeInsets.symmetric(
                vertical: 3,
                horizontal: 20,
                ),
                child:  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey[900],
                          ),
                      ),
                        SizedBox(
                  width: screenSize.width * 0.7 ,
                  child:Text(
                        "Deliver to ${userDetails.name} - ${userDetails.address}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:TextStyle(
                          color:Colors.grey[900],
                          ),
                          ),
                        ),
                    ],
                  ),
                ),
                ),
    );
  }
}