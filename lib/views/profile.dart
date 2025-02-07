import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app_with_firebase/constants.dart';
import 'package:shopping_app_with_firebase/widgets/user_detail_item.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? name = "";
  String? email = "";
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  //a function to get user cached data
  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name")!;
    email = prefs.getString("email")!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.mainColor,
        foregroundColor: Colors.white,
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/556669/pexels-photo-556669.jpeg?auto=compress&cs=tinysrgb&w=600'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 15),
              child: Text(
                name ?? "Loading..",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            //use UserDetailItem to view user info
            UserDetailItem(title: "Name", data: name ?? "Loading.."),
            UserDetailItem(title: "Email", data: email ?? "Loading.."),
          ],
        ),
      ),
    );
  }
}
