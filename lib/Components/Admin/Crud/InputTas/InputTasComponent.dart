import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:toko_tas_flutter/API/ConfigUrl.dart';
import 'package:toko_tas_flutter/Screens/Admin/Crud/EdittasScreen.dart';
import 'package:toko_tas_flutter/Screens/Admin/HomeAdminScreens.dart';
import 'package:toko_tas_flutter/size_config.dart';
import 'package:toko_tas_flutter/utils/constants.dart';

class InputTasComponent extends StatefulWidget {
    @override
  _InputTasComponent createState() => _InputTasComponent();
}

class _InputTasComponent extends State<InputTasComponent> {

  Response? response;
  var dio = Dio();
  var dataTas;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataTas();
  }

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
                        Container(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: dataTas == null ? 0 : dataTas.length,
                            itemBuilder: (BuildContext contex, int index){
                              return cardDataTas(dataTas[index]);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }

  Widget cardDataTas(data) {
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color:  Color.fromARGB(255, 255, 255, 255)),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: 1.0, color: Colors.white24))),
                child: Image.network('$baseUrl/${data['gambar']}'),
            ),
            title: Text(
              '${data['nama']}',
              style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, EditTasScreens.routeName, 
                    arguments: data);
                  } ,
                  child: Row(children: [
                    Icon(
                      Icons.edit,
                      color: kColorYellow,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                      "Edit", 
                        style: TextStyle(
                        color: mTitleColor, fontWeight: FontWeight.bold),
                        )
                  ]),
                ),
                GestureDetector(
                  onTap: () {
                    AwesomeDialog(
                      context: context, 
                      dialogType: DialogType.ERROR,
                      animType: AnimType.RIGHSLIDE,
                      title: 'Peringatan',
                      desc: 'Yakin Ingin Menghapus ${data['nama']} ?.....',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        hapusDataTas('${data['_id']}');
                      }).show();
                  },
                  child: Row(children: [
                    Icon(
                      Icons.delete,
                      color: kColorRedSlow,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                      "Hapus", 
                        style: TextStyle(
                        color: mTitleColor, fontWeight: FontWeight.bold),
                        ),
                  ]),
                )
              ]),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: mTitleColor,
                size: 30.0,
              ),
          ),
        ),
      );
    }

    void getDataTas() async {
      utilsApps.showDialog(context);
      bool status;
      var msg;
      try {
        response = await dio.get(getAllTas);

        status = response!.data['sukses'];
        msg = response!.data['msg'];
        if(status) {
          setState(() {
            dataTas = response!.data['data'];
            print(dataTas);
          });
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
              desc: 'Terjadi kesalahan pada server kami',
              btnOkOnPress: () {
                utilsApps.hideDialog(context);
              }).show();
      }
    }

      void hapusDataTas(id) async {
      utilsApps.showDialog(context);
      bool status;
      var msg;
      try {
        response = await dio.delete('$hapusTas/$id');
        status = response!.data['sukses'];
        msg = response!.data['msg'];
        if(status) {
            AwesomeDialog(
            context: context, 
            dialogType: DialogType.SUCCES,
            animType: AnimType.RIGHSLIDE,
            title: 'Peringatan',
            desc: '$msg',
            btnOkOnPress: () {
              // Navigator.pushAndRemoveUntil(
              //   context, HomeAdminScreens.routeName, (route) => false);
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
              desc: 'Terjadi kesalahan pada server kami',
              btnOkOnPress: () {
                utilsApps.hideDialog(context);
              }).show();
      }
    }
  }