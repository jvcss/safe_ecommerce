import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tio_bob_site/main.dart';
import 'package:flutter_responsive/flutter_responsive.dart';
import 'package:flutter_jsx/flutter_jsx.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}
class _MyApp extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Responsive Example',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 86, 61, 124),
        accentColor: Colors.black,

        // Define the default font family.
        fontFamily: 'Roboto',
      ),
      home: HomePage(),
    );
  }
}


//TODO HOME
//#region

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

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
                height: 360,
                width: mediaQueryData.size.width,

                child: Card(
                  borderOnForeground: false,
                  shadowColor: Colors.deepPurpleAccent,
                  color: Colors.transparent,
                  elevation: 7,
                  shape:  RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        //leading: Icon(Icons.album),
                        title: Text('Titulo'),
                        subtitle: Text('Descrição.'),
                      ),
                    ],

                  ),
                ),
              ),
            ]
        )
    ).toList();

   //


    return Scaffold(

        body: Container( //background
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          child:  SingleChildScrollView(
                  child: ResponsiveContainer(

                     maxWidth: double.infinity,//media
                    // Query.size.width * 0.95,
                    children: <Widget>[


                      ResponsiveCol(
                        backgroundColor: Colors.teal[100],
                          children: <Widget>[

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
                            )

                          ]
                      ),

                      ///ok
                      // ResponsiveRow(
                      //     margin: EdgeInsets.symmetric(vertical: 10),
                      //     children: <Widget>[
                      //
                      //       // By default, the column occupies the entire row, always
                      //       ResponsiveCol(
                      //           children: [
                      //             JSX(
                      //               '<div>'
                      //                   '<h3>Responsive Layouts</h3>'
                      //                   '<h6>for <i>Flutter</i></h6>'
                      //                   '<br><br>'
                      //                   '<p>Bellow there is an example of 12 columns, which changes the amount of each line depending of his father\'s widget size.</p>'
                      //                   '</div>',
                      //               display: DisplayLine.block,
                      //               padding: EdgeInsets.only(bottom: 20),
                      //               stylesheet: {
                      //                 'h3': JSXStylesheet(
                      //                     textStyle: TextStyle(color: themeData.primaryColor),
                      //                     displayLine: DisplayLine.block
                      //                 ),
                      //                 'h6': JSXStylesheet(
                      //                     textStyle: TextStyle(color: themeData.primaryColor),
                      //                     displayLine: DisplayLine.block
                      //                 )
                      //               },
                      //               margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      //             )
                      //           ]
                      //       )
                      //
                      //     ]..addAll(
                      //         responsiveGridExampe
                      //     )
                      // )


                    ],
                  )
              ),



        )
    );
  }
}
//#endregion