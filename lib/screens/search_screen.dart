import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class SearchScrren extends StatelessWidget {
  const SearchScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadonly:false,
         hasBackButton: true,
         ),
    );
  }
}