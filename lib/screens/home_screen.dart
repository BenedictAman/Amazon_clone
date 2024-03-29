//import 'package:amazon_clone/model/user_details_model.dart';
import 'package:amazon_clone/resources/cloudfirestore_methods.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/banner_ad_widget.dart';
import 'package:amazon_clone/widgets/categories_horizontal_list_view_bar.dart';
import 'package:amazon_clone/widgets/loading_widgets.dart';
import 'package:amazon_clone/widgets/products_showcase_list_view.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/user_details_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller =ScrollController();
  double offeset = 0;
  List<Widget>? discount70;
  List<Widget>? discount60;
  List<Widget>? discount50;
  List<Widget>? discount0;
  
  @override
  void initState(){
    super.initState();
    getData();
    controller.addListener(() {
      setState(() {
        offeset = controller.position.pixels;
      });
    });
  }
  @override
  void dispose(){
    super.dispose();
    controller.dispose();
  }

  void getData() async{
    List<Widget> temp70 = await CloudFireStoreClass().getProductsFromDiscount(70);
    List<Widget> temp60 = await CloudFireStoreClass().getProductsFromDiscount(60);
    List<Widget> temp50 = await CloudFireStoreClass().getProductsFromDiscount(50);
    List<Widget> temp0 = await CloudFireStoreClass().getProductsFromDiscount(0);
    print("everything is done");

    setState(() {
      discount70 = temp70;
      discount60 = temp60;
      discount50 = temp50;
      discount0 = temp0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:SearchBarWidget(
        isReadonly: true,
        hasBackButton: false,
      ),
      body:discount70!=null &&
      discount60!=null &&
      discount50!=null &&
      discount0!=null?
      Stack(
        children: [
          SingleChildScrollView(
            controller:controller,
            child: Column(
              children: [
                const SizedBox(
                  height: kAppBarHeight/2,
                ),
                const CategoriesHorizontallistViewBar(),
                const BannerAdWidget(),
                ProductsShowcaseListView(title: "Up to 70% off", children: discount70!,),
                ProductsShowcaseListView(title: "Up to 60% off", children: discount60!,),
                ProductsShowcaseListView(title: "Up to 50% off", children: discount50!,),
                ProductsShowcaseListView(title: "Explore", children:discount0!,),
              ],
            ),
          ),
          UserDetailsBar(
            offeset: offeset,
            ),
        ],
      ):const LoadingWidget(),
    );
}}