import 'package:flutter/material.dart';
import 'shopping_second_section_item.dart';

//a class contains the design of the second section of the page using "GridView"
class SecondSection extends StatelessWidget {
  //the lists required in this class and must send values to them using constructor
  final List<String> itemsNames;
  final List<String> itemsImages;
  const SecondSection(this.itemsNames, this.itemsImages, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        //a "GridView.builder" contains 4 items using "SecondSectionItem" widget with 2 items in each row
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return SecondSectionItem(itemsNames[index], itemsImages[index]);
          },
        ),
      ),
    );
  }
}
