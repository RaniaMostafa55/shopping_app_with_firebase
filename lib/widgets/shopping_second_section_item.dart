import 'package:flutter/material.dart';

import 'standard_image.dart';

//a class contains the design of the items in the second section
class SecondSectionItem extends StatelessWidget {
  //the variables required in this class and must send values to them using constructor
  final String name;
  final String imageName;
  const SecondSectionItem(this.name, this.imageName, {super.key});

  @override
  Widget build(BuildContext context) {
    //"GridTile" is a widget with child, header and footer
    return GridTile(
        //put the name of the item and shopping cart button in a "Row" in the footer part to be in the end of the "GridTile"
        footer: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 30,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                InkWell(
                  //make a "SnackBar" shows when clicking the button with a text message
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.green,
                        content: Center(
                          child: Text(
                            "Item added to the cart",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        )));
                  },
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 20,
                  ),
                )
              ],
            ),
          ),
        ),
        //call "StandardImage" which returns a styled image
        child: StandardImage(imageName));
  }
}
