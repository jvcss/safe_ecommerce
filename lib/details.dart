import 'package:flutter/material.dart';
import 'package:tio_bob_site/backgrounding.dart';

void openDetails(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(' page'),
        ),
        body: Container(
            decoration: backgrounded,
            child: Container(
              child: Center(
                child: Text('ESTILO & CORRICULO', style: TextStyle(fontSize: 52),),
              ),
            )),
      );
    },
  ));
}
