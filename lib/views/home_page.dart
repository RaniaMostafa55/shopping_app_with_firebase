import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_with_firebase/widgets/shooping_first_section.dart';
import 'package:shopping_app_with_firebase/widgets/shopping_second_section.dart';
import 'package:shopping_app_with_firebase/widgets/shopping_third_section.dart';
import 'package:shopping_app_with_firebase/widgets/title_text.dart';

import '../constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.white,
        //   ),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        backgroundColor: Colors.indigo,
        title: Text(
          "Home Page".tr(),
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          //a button to convert language of the app
          IconButton(
            onPressed: () {
              translate();
            },
            icon: const Icon(Icons.translate),
            color: Colors.white,
          )
        ],
      ),
      //make the page scrollable
      body: SingleChildScrollView(
        //make the scroll behaviour bouncing
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                //call the widget which contains a title styled text
                child: TitleText("Our Products".tr(), 20)),
            //call the widget which contains the first section of the page made with "PageView"
            FirstSection(
                Constants.controller, Constants.firstSectionProductsImages),
            //call the widget which contains the second section of the page made with "GridView"
            SecondSection(
                //check if the current language of the app is Arabic, then use the Arabic names of products list, otherwise use the English one
                context.locale == const Locale('en', 'US')
                    ? Constants.productsNamesEnglish
                    : Constants.productsNamesArabic,
                Constants.secondSectionProductsImages),
            Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
                child: TitleText("Hot Offers".tr(), 20)),
            //call the widget which contains the third section of the page made with "ListView"
            ThirdSection(
                //check if the current language of the app is Arabic, then use the Arabic names of products list, otherwise use the English one
                context.locale == const Locale('en', 'US')
                    ? Constants.productsNamesEnglish
                    : Constants.productsNamesArabic,
                Constants.thirdSectionProductsImages)
          ],
        ),
      ),
    );
  }

// a method to convert the language of the app to English or Arabic
  void translate() {
    if (context.locale == const Locale('en', 'US')) {
      context.setLocale(const Locale('ar', 'EG'));
    } else {
      context.setLocale(const Locale('en', 'US'));
    }
  }
}
