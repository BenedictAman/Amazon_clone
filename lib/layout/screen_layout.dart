import 'package:amazon_clone/providers/user_details_provider.dart';
import 'package:amazon_clone/resources/cloudfirestore_methods.dart';
import 'package:amazon_clone/utils/color_theams.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({super.key});

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  PageController pageController = PageController();
  // ignore: non_constant_identifier_names
  int CurrentPage = 0;

  @override
  void dispose(){
    super.dispose();
    pageController.dispose();
  }

  changePage(int page){
     pageController.jumpToPage(page);
            setState(() {
              CurrentPage = page;
            });
  }

  void initstate(){
    super.initState();
    CloudFireStoreClass().getNameAndAddress();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<UserDetailsProvider>(context).getData;
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          body: PageView(
            controller:pageController ,
            children:screens,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey[400]!,width: 1),
                ),
                ),
            child: TabBar(
              indicator:const BoxDecoration(
                border: Border(
                  top:BorderSide(color: activeCyanColor,width: 4),
                  ),
                  ),
              onTap: changePage,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
              Tab(
                child: Icon(Icons.home_outlined,
                color: CurrentPage==0? activeCyanColor:Colors.black,),
                ),
                 Tab(
                child: Icon(Icons.account_circle_outlined,
                color: CurrentPage==1? activeCyanColor:Colors.black,),
                ),
                 Tab(
                child: Icon(Icons.shopping_cart_outlined,
                color: CurrentPage==2? activeCyanColor:Colors.black,),
                ),
                 Tab(
                child: Icon(Icons.menu,
                color: CurrentPage==3? activeCyanColor:Colors.black,),
                ),
                ]
                ),
          ),  
          ),
      ),
    );
  }
}