import 'package:flutter/material.dart';

//a class contains the design of the items in the third section
class ThirdSectionItem extends StatelessWidget {
  //the variables required in this class and must send values to them using constructor
  final String imageName;
  final String name;
  const ThirdSectionItem(this.imageName, this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //"Expanded" widget to make widgets evenly spaced
        Expanded(
          //add the items images
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Image.network(
                imageName,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.height * 0.2,
              ),
            ),
          ),
        ),
        Expanded(
          //add the items names
          child: Text(
            name,
            style: const TextStyle(
                color: Colors.indigo,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
