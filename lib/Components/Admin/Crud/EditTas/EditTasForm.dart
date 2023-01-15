import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toko_tas_flutter/API/ConfigUrl.dart';
import 'package:toko_tas_flutter/Components/custom_surfix_icon.dart';
import 'package:toko_tas_flutter/Components/default_button_custome_color.dart';
import 'package:toko_tas_flutter/Screens/Admin/Crud/EditTasScreen.dart';
import 'package:toko_tas_flutter/Screens/User/HomeUserScreens.dart';
import 'package:toko_tas_flutter/size_config.dart';
import 'package:toko_tas_flutter/utils/constants.dart';

import '../../../../Screens/Admin/HomeAdminScreens.dart';

class FormEditTas extends StatefulWidget {
  @override
  _FormEditTas createState() => _FormEditTas();
}

class _FormEditTas extends State<FormEditTas> {
  TextEditingController txtNamaTas = TextEditingController(
    text: '${EditTasScreens.dataTas['nama']}'),
                        txtTipeTas = TextEditingController(
                          text: '${EditTasScreens.dataTas['tipe']}'),
                        txtHargaTas = TextEditingController(
                          text: '${EditTasScreens.dataTas['harga']}'),
                        txtMerekTas = TextEditingController(
                          text: '${EditTasScreens.dataTas['merk']}');

    FocusNode focusNode = new FocusNode();
    File? image;
    Response? response;
    var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildNamaTas(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildTipeTas(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildHargaTas(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildMerekTas(),
          SizedBox(height: getProportionateScreenHeight(30)),
          image == null 
          ? Image.network('$baseUrl/${EditTasScreens.dataTas['gambar']}', 
          fit: BoxFit.cover,
          )
           : Image.file(
              image!,
              // width: 250,
              // height: 250,
              fit: BoxFit.cover,
          ),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text: "Pilih Gambar Tas",
            press: () {
              pilihGambar();
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text: "SUBMIT",
            press: () {
              if(txtNamaTas.text == ''){
                AwesomeDialog(
                  context: context, 
                  dialogType: DialogType.ERROR,
                  animType: AnimType.RIGHSLIDE,
                  title: 'Peringatan',
                  desc: 'Nama Tas Tidak Boleh Kosong',
                  btnOkOnPress: () {})
                  .show();
              }else if(txtTipeTas.text == ''){
                AwesomeDialog(
                  context: context, 
                  dialogType: DialogType.ERROR,
                  animType: AnimType.RIGHSLIDE,
                  title: 'Peringatan',
                  desc: 'Tipe Tas Tidak Boleh Kosong',
                  btnOkOnPress: () {})
                  .show();
              }else if(txtHargaTas.text == ''){
                AwesomeDialog(
                  context: context, 
                  dialogType: DialogType.ERROR,
                  animType: AnimType.RIGHSLIDE,
                  title: 'Peringatan',
                  desc: 'Harga Tas Tidak Boleh Kosong',
                  btnOkOnPress: () {})
                  .show();
              }else if(txtMerekTas.text == '') {
                AwesomeDialog(
                  context: context, 
                  dialogType: DialogType.ERROR,
                  animType: AnimType.RIGHSLIDE,
                  title: 'Peringatan',
                  desc: 'Merek Tas Tidak Boleh Kosong',
                  btnOkOnPress: () {})
                  .show();
              }else {
                editDataTas(txtNamaTas.text, txtTipeTas.text,
                txtHargaTas.text, txtMerekTas.text, image?.path);
              }
            },
          ),
          SizedBox(height: 20,
          ),
        ],
      ),
    );
  }
  
  TextFormField buildNamaTas() {
    return TextFormField(
      controller: txtNamaTas,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Nama Tas',
          hintText: 'Masukan Nama Tas',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.add_chart_sharp)),
        );
      }

    TextFormField buildTipeTas() {
      return TextFormField(
      controller: txtTipeTas,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Tipe Tas',
          hintText: 'Masukan Tipe Tas',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.add_chart_sharp)),
        );
      }

      TextFormField buildHargaTas() {
      return TextFormField(
      controller: txtHargaTas,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Harga Tas',
          hintText: 'Masukan Harga Tas',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.add_chart_sharp)),
        );
      }

      TextFormField buildMerekTas() {
      return TextFormField(
      controller: txtMerekTas,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Merek Tas',
          hintText: 'Masukan Merek Tas',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.add_chart_sharp)),
        );
      }

      Future pilihGambar() async {
        try {
          final image = await ImagePicker.pickImage(source: ImageSource.gallery);
          if(image == null) return;
          final imageTemp = File(image.path);
          setState(()=> this.image= imageTemp);
        } on PlatformException catch (e) {
          print("Gagal mengambil foto : $e");
      }
    }

    void editDataTas(nama, tipe, harga, merk, gambar) async {
      utilsApps.showDialog(context);
      bool status;
      var msg;
      try {
        var formData = FormData.fromMap({
          'nama' : nama,
          'tipe' : tipe,
          'harga' : harga,
          'merk' : merk,
          'gambar' : image == null ? '' : await MultipartFile.fromFile(gambar)
        });
        response = await dio.put(
          '$editDataTas/${EditTasScreens.dataTas['_id']}', 
          data: formData);
        status = response!.data['sukses'];
        msg = response!.data['msg'];
        if (status) {
          AwesomeDialog(
            context: context, 
            dialogType: DialogType.SUCCES,
            animType: AnimType.RIGHSLIDE,
            title: 'Peringatan',
            desc: '$msg',
            btnOkOnPress: () {
              utilsApps.hideDialog(context);
              Navigator.pushNamed(context, HomeAdminScreens.routeName);
            }).show();
        } else {
          AwesomeDialog(
            context: context, 
            dialogType: DialogType.ERROR,
            animType: AnimType.RIGHSLIDE,
            title: 'Peringatan',
            desc: '$msg',
            btnOkOnPress: () {
              utilsApps.hideDialog(context);
            }).show();
        }
      } catch (e) {
        print(e);
        AwesomeDialog(
            context: context, 
            dialogType: DialogType.ERROR,
            animType: AnimType.RIGHSLIDE,
            title: 'Peringatan',
            desc: 'Terjadi Kesalahan Pada Server Kami!!!',
            btnOkOnPress: () {
              utilsApps.hideDialog(context);
            }).show();
      }
    }
  }