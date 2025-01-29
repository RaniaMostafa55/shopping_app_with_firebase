import 'package:flutter/material.dart';
import 'shopping_first_section_item.dart';

//a class contains the design of the first section of the page using "PageView"
class FirstSection extends StatelessWidget {
  //the variables and lists required in this class and must send values to them using constructor
  final PageController controller;
  final List<String> itemsImages;
  const FirstSection(this.controller, this.itemsImages, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.22,
      //a "PageView.builder" contains 3 images using "FirstSectionItem" widget
      child: PageView.builder(
        controller: controller,
        itemCount: 3,
        itemBuilder: (context, index) {
          return FirstSectionItem(itemsImages[index]);
        },
      ),
    );
  }
}
