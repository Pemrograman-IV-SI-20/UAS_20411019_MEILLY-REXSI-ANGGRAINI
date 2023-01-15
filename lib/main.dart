import 'package:flutter/material.dart';
import 'package:toko_tas_flutter/Screens/Login/LoginScreens.dart';
import 'package:toko_tas_flutter/routes.dart';
import 'package:toko_tas_flutter/theme.dart';

void main() async {
  runApp(
    MaterialApp(
      title: "Toko Tas Keren",
      theme: theme(),
      initialRoute: LoginScreen.routeName,
      routes: routes,
    )
  );
}
