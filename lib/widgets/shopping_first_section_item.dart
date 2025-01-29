import 'package:flutter/material.dart';
import 'standard_image.dart';

//a class contains the design of the items in the first section
class FirstSectionItem extends StatelessWidget {
  //the variable required in this class and must send value to it using constructor
  final String imageName;
  const FirstSectionItem(this.imageName, {super.key});

  @override
  Widget build(BuildContext context) {
    //call "StandardImage" which returns a styled image
    return StandardImage(imageName);
  }
}
