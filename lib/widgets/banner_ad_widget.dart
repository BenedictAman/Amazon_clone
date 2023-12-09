import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  int currentAd = 0;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      largeAds[currentAd],
      width:double.infinity,
    );
  }
}