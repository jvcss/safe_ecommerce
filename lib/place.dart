import 'package:flutter/material.dart';
import 'package:tio_bob_site/backgrounding.dart';

void openLocation(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Endereço Studio'),
        ),
        body: Container(
            decoration: backgrounded,
            child: Container(
              child: Center(
                child: Text('MAPA VEM AQUI', style: TextStyle(fontSize: 52),),
              ),
            )),
      );
    },
  ));
}
