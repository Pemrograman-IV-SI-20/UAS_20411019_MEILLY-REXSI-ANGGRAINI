import 'package:flutter/material.dart';
import '../../Components/User/HomeUserComponents.dart';
import '../../size_config.dart';
import '../../utils/constants.dart';

class HomeUserScreen extends StatelessWidget {
  static String routeName = "/home_user";

  @override 
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text("GIBag",style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
        leading: Icon(
          Icons.home,
          color: mTitleColor,
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Icon(
                  Icons.person,
                  color: mTitleColor,
                  ),
            ),
            SizedBox(width: 10,
            )
          ],
      ),
     body: HomeUserComponent(),
    );
  }
}