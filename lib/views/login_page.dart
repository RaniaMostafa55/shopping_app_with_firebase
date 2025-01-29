import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_with_firebase/constants.dart';
import 'package:shopping_app_with_firebase/views/home_page.dart';
import 'package:shopping_app_with_firebase/views/signup_page.dart';
import 'package:shopping_app_with_firebase/widgets/custom_button.dart';
import 'package:shopping_app_with_firebase/widgets/custom_text_field.dart';
import 'package:shopping_app_with_firebase/widgets/global_text_button.dart';
import 'package:shopping_app_with_firebase/widgets/title_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //use "SingleChildScrollView" to make the page scrollable
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: Constants.loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //call "TitleText" widget to add the title of the page
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2,
                    bottom: MediaQuery.of(context).size.height * 0.05),
                child: TitleText(tr('Login'), 40),
              ),

              Padding(
                  padding: const EdgeInsets.all(15.0),
                  //call "CustomTextField" to ask the user to enter data
                  child: CustomTextField(
                    controller: Constants.loginEmailController,
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
                    controller: Constants.loginPasswordController,
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
                    //convert the value of "isPassHidden" variable when pressing the suffix icon to show and hide password
                    onSuffixPressed: () {
                      setState(() {
                        Constants.isPassHidden = !Constants.isPassHidden;
                      });
                    },
                  )),

              //call "CustomButton" to add a "Login" button
              CustomButton(
                  onPressed: () async {
                    if (Constants.loginFormKey.currentState!.validate()) {
                      //Use firebase authentication to login
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: Constants.loginEmailController.text,
                          password: Constants.loginPasswordController.text,
                        );
                        Constants.loginEmailController.clear();
                        Constants.loginPasswordController.clear();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Signed in successfully".tr()),
                        ));
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return MyHomePage();
                          },
                        ));
                      } on FirebaseAuthException catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(e.message!),
                        ));
                      }
                    }
                  },
                  text: tr("Login")),
              //a textButton to go to sign up page
              GlobalTextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SignUpPage();
                      },
                    ));
                  },
                  text: "Don't have account? Sign up".tr())
            ],
          ),
        ),
      ),
    );
  }
}
