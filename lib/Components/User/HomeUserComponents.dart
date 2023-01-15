import 'package:flutter/cupertino.dart';
import 'package:toko_tas_flutter/size_config.dart';
import 'package:toko_tas_flutter/utils/constants.dart';

class HomeUserComponent extends StatefulWidget{
@override
_HomeUserComponent createState() => _HomeUserComponent();
}

class _HomeUserComponent extends State<HomeUserComponent> {
@override
Widget build(BuildContext context){
  return SafeArea(
    child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: 
          EdgeInsets.symmetric(horizontal : getProportionateScreenHeight(20)),
        child: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10), 
            child: Text(
              "Layanan", 
              style: mTitleStyle,
             ),
            )
           ],
         )),
        ),
      ));
    }

  Widget menuLayanan() {
    return Container(
      height: 70,
      child: Column(children: [

      ] ),
    );
  }
}