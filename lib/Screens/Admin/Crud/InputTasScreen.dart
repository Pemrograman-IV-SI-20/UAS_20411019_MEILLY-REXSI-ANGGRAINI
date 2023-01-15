import 'package:flutter/material.dart';
import 'package:toko_tas_flutter/Components/Admin/Crud/InputTas/InputTasComponent.dart';
import 'package:toko_tas_flutter/utils/constants.dart';

class InputTasScreens extends StatelessWidget {
  static var routeName = '/input_Tas_screens';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Input Data Tas", 
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: InputTasComponent(),
    );
  }
}