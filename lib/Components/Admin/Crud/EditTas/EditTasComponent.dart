import 'package:flutter/cupertino.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:toko_tas_flutter/Components/Admin/Crud/EditTas/EditTasForm.dart';
import 'package:toko_tas_flutter/Components/Admin/Crud/Inputtas/InputtasForm.dart';
import 'package:toko_tas_flutter/Components/Login/LoginForm.dart';
import 'package:toko_tas_flutter/size_config.dart';
import 'package:toko_tas_flutter/utils/constants.dart';

import 'EditTasForm.dart';

class EditTasComponent extends StatefulWidget {
    @override
  _EditTasComponent createState() => _EditTasComponent();
}

class _EditTasComponent extends State<EditTasComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.04,
                    ),
                    Padding(padding: EdgeInsets.only(left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Input Data Tas !",
                          style: mTitleStyle,
                        )
                      ],
                    )),
                    SizedBox(
                      height: 20,
                      ),
                      FormEditTas()
              ],
            ),
          ),
        ),
      ),
    );
  }
}