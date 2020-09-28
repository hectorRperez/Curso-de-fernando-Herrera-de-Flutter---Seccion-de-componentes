import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
            child: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                  'https://www.lavanguardia.com/r/GODO/LV/p7/WebSite/2020/05/13/Recortada/img_sarbat_20200325-150804_imagenes_lv_otras_fuentes_unknown-kuvH-U481133040246VnB-992x558@LaVanguardia-Web.jpg'),
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          fit: BoxFit.fill,
          fadeInDuration: Duration(milliseconds: 200),
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://assets.show.news/__export/1583271031271/sites/debate/img/2020/03/03/lipa-dua_png_crop1583270977860.jpg_943222218.jpg'),
        ),
      ),
    );
  }
}
