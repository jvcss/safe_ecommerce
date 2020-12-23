// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tio_bob_site/details.dart';
import 'package:tio_bob_site/place.dart';
import 'package:tio_bob_site/style.dart';
import 'package:tio_bob_site/gallery.dart';
import 'package:tio_bob_site/backgrounding.dart';

import 'package:flutter_jsx/flutter_jsx.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:flutter_responsive/flutter_responsive.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tio Bob Tattoo',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.deepPurple[300],
        //primaryColor: Colors.black54,
        primaryColor: Colors.black,
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.normal,
              color: Colors.deepPurpleAccent),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
              color: Colors.deepPurple[200]),
          caption: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: Colors.deepPurpleAccent),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {


    ThemeData themeData = Theme.of(context);
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    /*create 12 columns*/
    List<Widget> responsiveGridExampe =

    /*repeat 12 times*/
    List<int>.generate(4, (index) => index).map((colIndex) =>
        ResponsiveCol(
            padding: EdgeInsets.all(10),
            gridSizes: {
              ScreenSize.xl : 3,
            },
            children: [

              Container(

                height: 200,
                width: mediaQueryData.size.width,
                child: Card(


                  elevation: 20,
                  margin: EdgeInsets.only(left: 30,right: 30),
                  shadowColor: Colors.deepPurpleAccent,
                  shape:  RoundedRectangleBorder(
                    side: BorderSide(color: Colors.deepPurple, width: 0.1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Colors.transparent,
                  child: Center(
                    //    widthFactor: c,
                    child: ListTile(
                      title: Text('Titulo',textAlign: TextAlign.center,),
                      subtitle: Text('Descrição.',textAlign: TextAlign.center,),
                    ),
                  ),
                ),
              ),
            ]
        )
    ).toList();

    return Scaffold(
      // appBar: AppBar(
      //    backgroundColor: Colors.transparent,
      //
      //   title: appLogo,
      //   actions: <Widget>[
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         IconButton(
      //           icon: const Icon(Icons.place_outlined),
      //           tooltip: 'Localização',
      //           onPressed: () {
      //             openLocation(context);
      //           },
      //         ),
      //         IconButton(
      //           icon: const Icon(Icons.article_outlined),
      //           tooltip: 'Detalhes',
      //           onPressed: () {
      //             openDetails(context);
      //           },
      //         ),
      //         IconButton(
      //           icon: const Icon(Icons.amp_stories_outlined),
      //           tooltip: 'Galeria',
      //           onPressed: () {
      //             openGallery(context);
      //           },
      //         ),
      //       ],
      //     ),
      //   ],
      // ),



      body:
      Container(
        //    constraints: BoxConstraints.expand(),
        width: mediaQueryData.size.width,
        height: mediaQueryData.size.height,
        decoration: backgrounded,
        child:
        SingleChildScrollView(
          child: ResponsiveContainer(
            maxWidth: double.infinity,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appLogo,
                  IconButton(
                    icon: const Icon(Icons.place_outlined),
                    tooltip: 'Localização',
                    onPressed: () {
                      openLocation(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.article_outlined),
                    tooltip: 'Detalhes',
                    onPressed: () {
                      openDetails(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.amp_stories_outlined),
                    tooltip: 'Galeria',
                    onPressed: () {
                      openGallery(context);
                    },
                  ),
                ],
              ),

              ResponsiveRow(
                  children: <Widget>[
                    // By default, the column occupies the entire row, always
                    ResponsiveCol(
                        children: [
                          Container(
                            height: 480,
                            width: mediaQueryData.size.width,
                            child: Card(
                              elevation: 7,
                              shadowColor: Colors.deepPurpleAccent,
                              color: Colors.transparent,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                    title: Text('Titulo'),
                                    subtitle: Text('Descrição.'),
                                  ),
                                ],

                              ),
                            ),
                          ),



                        ]
                    ),

                  ]..addAll(
                      responsiveGridExampe
                  )
              ),
              Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Image.asset('images/instagram-64.png'),
                    tooltip: 'Instagram',
                    iconSize: 28,
                    onPressed: () {
                      js.context.callMethod('open',
                          ['https://www.instagram.com/tiobobtattoogn/']);
                    },
                  ),
                  IconButton(
                    icon: Image.asset('images/facebook-64.png'),
                    tooltip: 'Facebook',
                    iconSize: 28,
                    onPressed: () {
                      js.context.callMethod('open',
                          ['https://www.facebook.com/douglas.miranda.549']);
                    },
                  ),
                  IconButton(
                    icon: Image.asset('images/whatsapp-64.png'),
                    tooltip: 'WhatsApp',
                    iconSize: 28,
                    onPressed: () {
                      js.context
                          .callMethod('open', ['tiobob.page.link/tattoos']);
                    },
                  ),
                ],
              ),


            ],
          ),

        ),

      ),




    );
  }
}
