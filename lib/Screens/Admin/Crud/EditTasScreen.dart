import 'package:flutter/material.dart';
import 'package:toko_tas_flutter/size_config.dart';
import 'package:toko_tas_flutter/utils/constants.dart';

import '../../../Components/Admin/Crud/EditTas/EditTasComponent.dart';

class EditTasScreens extends StatelessWidget {
  static var routeName = '/edit_tas_screens';
  static var dataTas;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    dataTas = ModalRoute.of(context)!.settings.arguments as Map;

    print(dataTas);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Edit Data Tas", 
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: EditTasComponent(),
    );
  }
}