import 'package:flutter/material.dart';
import 'constants.dart';
import 'test_veri.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700], //arka plan rengi
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  /* dogruIconu, dogruIconu, dogruIconu, yanlisIconu, yanlisIconu
    //adı secim ve elemanları widget ları bir liste elde etmiş oldum*/

  TestVeri test_1 = TestVeri();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          //rowdu taşmadan dolayı wrap yaptık(yüzler taşmıştı sayfa sonunda)
          runSpacing: 3, //dikey
          spacing: 3, //gülücükler arası boşluk(yatay)
          children: secimler, //listemin adını verdim
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.red[400],
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              //butona basıldığında yeniden sayfa oluşmuş olacak
                              test_1.getSoruYaniti() == false ? secimler.add(dogruIconu) : secimler.add(yanlisIconu);
                              test_1.sonrakiSoru();
                              // secimler.add(yanlisIconu); //bir listeye eleman ekleme komutu
                            });
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.green[400],
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            setState(() {
                              test_1.getSoruYaniti() == true ? secimler.add(dogruIconu) : secimler.add(yanlisIconu);
                              test_1.sonrakiSoru();
                              // secimler.add(yanlisIconu); //bir listeye eleman ekleme komutu
                            });
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}
