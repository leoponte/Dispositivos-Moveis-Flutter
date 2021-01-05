import 'package:flutter/material.dart';

class ItemHomePage extends StatelessWidget {
  final String url;
  final String text;

  const ItemHomePage({this.url, this.text});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          margin: const EdgeInsets.only(
              left: 10.0, right: 10.0, bottom: 10.0, top: 30.0),
          child: Material(
            borderRadius: BorderRadius.circular(8.0),
            elevation: 10.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  url,
                  fit: BoxFit.cover,
                  width: 200.0,
                  height: 200.0,
                ),
                Container(
                    child: Flexible(
                  child: Text(
                      //"   Você sabia que uma de\n nossas prioridades no \n CCP também é zelar pelo\n meio ambiente?\n   Esse projeto é um de\n muitos!\n   Nossos companheiros \n se reunem de manhã para\n separar os materiais de\n reciclagem coletados na\n região.",
                      text,
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black)),
                ))
              ],
            ),
          )),
    );
  }
}
/*
              */
