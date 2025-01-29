import 'package:flutter/material.dart';
import 'shopping_third_section_item.dart';

//a class contains the design of the third section of the page using "ListView"
class ThirdSection extends StatelessWidget {
  //the lists required in this class and must send values to them using constructor
  final List<String> itemsNames;
  final List<String> itemsImages;
  const ThirdSection(this.itemsNames, this.itemsImages, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      //a "ListView.builder" contains 5 items using "ThirdSectionItem" widget and scrolling horizontally
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        //"shrinkWrap" is set to true to make the listView takes only the size of its content and not more
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return ThirdSectionItem(itemsImages[index], itemsNames[index]);
        },
      ),
    );
  }
}
