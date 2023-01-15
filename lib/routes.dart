import 'package:flutter/material.dart';
import 'package:toko_tas_flutter/Screens/Admin/Crud/EditTasScreen.dart';
import 'package:toko_tas_flutter/Screens/Admin/Crud/InputTasScreen.dart';
import 'package:toko_tas_flutter/Screens/Admin/Crud/InputTasScreen.dart';
import 'package:toko_tas_flutter/Screens/Admin/HomeAdminScreens.dart';
import 'package:toko_tas_flutter/Screens/Register/RegistrasiScreens.dart';
import 'package:toko_tas_flutter/Screens/Login/LoginScreens.dart';
import 'package:toko_tas_flutter/Screens/User/HomeUserScreens.dart';

final Map<String, WidgetBuilder> routes = {
  // Login registrasi
  LoginScreen.routeName:(context) => LoginScreen(),
  RegisterScreen.routeName:(context) => RegisterScreen(),

  //routes user biasa
  HomeUserScreen.routeName:(context) => HomeUserScreen(),

  //routes admin
  HomeAdminScreens.routeName:(context) => HomeAdminScreens(),
  InputTasScreens.routeName:(context) => InputTasScreens(),
  EditTasScreens.routeName:(context) => EditTasScreens(),
};
