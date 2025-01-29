import 'package:flutter/material.dart';

//a class contains the image style used many times in the app
class StandardImage extends StatelessWidget {
  //the variable required in this class and must send value to it using constructor
  final String imagePath;
  const StandardImage(this.imagePath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      //a container to put the network image in and fit it in the container which has circular borders and clip it
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Image.network(
          (imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
