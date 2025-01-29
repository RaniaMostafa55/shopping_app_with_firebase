import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_with_firebase/views/home_page.dart';
import 'package:shopping_app_with_firebase/widgets/custom_button.dart';
import 'package:shopping_app_with_firebase/widgets/custom_text_field.dart';
import 'package:shopping_app_with_firebase/widgets/global_text_button.dart';
import 'package:shopping_app_with_firebase/widgets/title_text.dart';
import '../constants.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: Constants.registerFormKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2,
                    bottom: MediaQuery.of(context).size.height * 0.05),
                child: TitleText(tr('sign_up'), 40),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomTextField(
                    controller: Constants.fullnameController,
                    label: tr('full_name'),
                    prefix: Icons.person,
                    validator: (value) {
                      if (value!.isEmpty) {
                        Constants.errors.add(tr("please_enter_your_full_name"));
                        return tr("please_enter_your_full_name");
                      } else if (!RegExp(r'[A-Z]').hasMatch(value[0])) {
                        Constants.errors
                            .add(tr("first_letter_should_be_capitalized"));
                        return tr("first_letter_should_be_capitalized");
                      } else {
                        return null;
                      }
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomTextField(
                    controller: Constants.registerEmailController,
                    label: tr("email_address"),
                    prefix: Icons.email,
                    validator: (value) {
                      if (!value!.contains("@")) {
                        Constants.errors.add(tr("please_enter_a_valid_email"));
                        return tr("please_enter_a_valid_email");
                      } else {
                        return null;
                      }
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomTextField(
                    controller: Constants.registerPasswordController,
                    label: tr("password"),
                    prefix: Icons.lock,
                    validator: (value) {
                      if (value!.length < 6) {
                        Constants.errors.add(tr(
                            "password_should_contain_at_least_6_characters"));
                        return tr(
                            "password_should_contain_at_least_6_characters");
                      } else {
                        return null;
                      }
                    },
                    isPassword: true,
                    obscureText: Constants.isPassHidden,
                    onSuffixPressed: () {
                      setState(() {
                        Constants.isPassHidden = !Constants.isPassHidden;
                      });
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomTextField(
                    controller: Constants.confirmPasswordController,
                    label: tr("confirm_password"),
                    prefix: Icons.lock,
                    validator: (value) {
                      if (value!.isEmpty) {
                        Constants.errors
                            .add("Please confirm your password".tr());
                        return "Please confirm your password".tr();
                      } else if (value !=
                          Constants.registerPasswordController.text) {
                        Constants.errors.add("Passwords don't match".tr());
                        return "Passwords don't match".tr();
                      } else {
                        return null;
                      }
                    },
                    isPassword: true,
                    obscureText: Constants.isConfirmPassHidden,
                    onSuffixPressed: () {
                      setState(() {
                        Constants.isConfirmPassHidden =
                            !Constants.isConfirmPassHidden;
                      });
                    },
                  )),
              //call "CustomButton" to add a "sign up" button
              CustomButton(
                  onPressed: () async {
                    if (Constants.registerFormKey.currentState!.validate()) {
                      //Use firebase authentication to sign up
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: Constants.registerEmailController.text,
                          password: Constants.registerPasswordController.text,
                        );
                        signUpDialog();
                      } on FirebaseAuthException catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(e.message!),
                        ));
                      }
                    } else {
                      //if even one requirement is not met, a "SnackBar" will show up containing all the errors found in the errors list
                      SnackBar snackBar = SnackBar(
                        content: ListView.builder(
                          shrinkWrap: true,
                          itemCount: Constants.errors.length,
                          itemBuilder: (context, index) {
                            return Text(Constants.errors[index]);
                          },
                        ),
                        duration: const Duration(seconds: 3),
                        //after the "SnackBar" shows up, the errors list will be clear in order to avoid duplicates if the user repeated a certain error
                        onVisible: () {
                          Constants.errors.clear();
                        },
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  text: tr("sign_up")),
              GlobalTextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: "Already have an account? Sign in".tr())
            ],
          ),
        ),
      ),
    );
  }

  // a function created to make an alert dialog show up to tell the user that he signed up successfully
  Future<void> signUpDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Success".tr()),
          content: Text("account created successfully".tr()),
          actions: [
            //a "close button", if the user pressed that button all the textfields will be clear and navigate to "MyHomePage"
            ElevatedButton(
                onPressed: () {
                  //in order to remove the "AlertDialog" from stack then add "MyHomePage" by navigating to it
                  Navigator.pop(context);
                  Constants.fullnameController.clear();
                  Constants.registerEmailController.clear();
                  Constants.registerPasswordController.clear();
                  Constants.confirmPasswordController.clear();
                  Navigator.push(
                      context,
                      //use "PageRouteBuilder" to identify the page which will navigate to and the way of transition
                      PageRouteBuilder(
                          //identify the page which we want to navigate to
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const MyHomePage(),
                          //identify how the transition will be during navigation
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            //determine the speed of transition "easeInOut" to start with low speed, then high, then low again
                            var curvedAnimation = CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeInOut,
                            );
                            //create fade out and in transition
                            return FadeTransition(
                              //"curvedAnimation" is put in "opacity" parameter to play the fade transition as mentioned before, with low speed, then high, then low again
                              opacity: curvedAnimation,
                              //child holds the page we want to navigate to
                              child: child,
                            );
                          },
                          transitionDuration:
                              const Duration(milliseconds: 850)));
                },
                child: Text("close".tr()))
          ],
        );
      },
    );
  }
}
