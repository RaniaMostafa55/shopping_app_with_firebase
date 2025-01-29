import 'package:flutter/material.dart';

class Constants {
  //the variables and lists used in the app
  static PageController controller = PageController();
  static List<String> firstSectionProductsImages = [
    "https://images.pexels.com/photos/1667071/pexels-photo-1667071.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/892649/pexels-photo-892649.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/6724353/pexels-photo-6724353.jpeg?auto=compress&cs=tinysrgb&w=600",
  ];
  static List<String> secondSectionProductsImages = [
    "https://images.pexels.com/photos/4735904/pexels-photo-4735904.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/2720447/pexels-photo-2720447.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/8101512/pexels-photo-8101512.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/6167446/pexels-photo-6167446.jpeg?auto=compress&cs=tinysrgb&w=600"
  ];
  static List<String> thirdSectionProductsImages = [
    "https://images.pexels.com/photos/1667071/pexels-photo-1667071.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/892649/pexels-photo-892649.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/6724353/pexels-photo-6724353.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/2720447/pexels-photo-2720447.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/8101512/pexels-photo-8101512.jpeg?auto=compress&cs=tinysrgb&w=600",
  ];
  static List<String> productsNamesEnglish = [
    "Product 1",
    "Product 2",
    "Product 3",
    "Product 4",
    "Product 5"
  ];
  static List<String> productsNamesArabic = [
    "منتج 1",
    "منتج 2",
    "منتج 3",
    "منتج 4",
    "منتج 5",
  ];

//create some controllers for textFields
  static TextEditingController fullnameController = TextEditingController();
  static TextEditingController registerEmailController =
      TextEditingController();
  static TextEditingController registerPasswordController =
      TextEditingController();
  static TextEditingController confirmPasswordController =
      TextEditingController();
  static TextEditingController loginEmailController = TextEditingController();
  static TextEditingController loginPasswordController =
      TextEditingController();
//create the key that will be used in the form
  static final registerFormKey = GlobalKey<FormState>();
  static final loginFormKey = GlobalKey<FormState>();
//create these two variables to check if the password will be secured in "Password" and "confirmPassword" fields or not
  static bool isPassHidden = true;
  static bool isConfirmPassHidden = true;
//create an empty list to add any error we find to it while taking inputs from user
  static List<String> errors = [];
}
