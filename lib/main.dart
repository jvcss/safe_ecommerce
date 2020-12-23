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



      body: Container(
          //    constraints: BoxConstraints.expand(),
          decoration: backgrounded,
          child:

          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //TODO CABEÇALHO
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

               Container(

                    child:
                      SingleChildScrollView(

                          child:
                          ResponsiveCol(
                                  children: <Widget>[

                                    ResponsiveRow(
                                 //       margin: EdgeInsets.symmetric(vertical: 10),

                                        children: <Widget>[

                                          // By default, the column occupies the entire row, always
                                          ResponsiveCol(
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
                                                        title: Text('Titulo1',textAlign: TextAlign.center,),
                                                        subtitle: Text('Descrição.1',textAlign: TextAlign.center,),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]
                                          )

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


                      ),

                  ),



                // SingleChildScrollView(
                //
                //     child:
                //       ResponsiveContainer(
                //        // margin: EdgeInsets.only(bottom: ),
                //       //maxWidth: ResponsiveScreen.limits[ScreenSize.lg],
                //
                //       children: <Widget>[
                //         //TODO titulo SUBHEADER
                //         ResponsiveRow(
                //           alignment: Alignment.center,
                //           //  mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Text('Como ter a tattoo perfeita',
                //                 textAlign: TextAlign.center,
                //                 style: Theme.of(context).textTheme.headline1),
                //           ],
                //         ),
                //         ResponsiveRow(
                //           //  mainAxisAlignment: MainAxisAlignment.center,
                //           alignment: Alignment.center,
                //           margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                //           children: [
                //             Text(
                //               'Primeiramente é necessário sempre ouvir as orientações do seu tatuador.'
                //                   'Se adaptar para essas instruções é garantir um bom resultado e caso preciso seu retoque gratuito!',
                //               style: Theme.of(context).textTheme.bodyText2,
                //               textAlign: TextAlign.center,
                //             ),
                //           ],
                //         ),
                //
                //         //*******TODO TIPS
                //         ResponsiveCol(
                //           height: double.infinity,
                //           width: double.infinity,
                //           children: [
                //
                //
                //             ResponsiveCol(
                //               margin: EdgeInsets.symmetric(horizontal: 30),
                //               gridSizes: {
                //                 ScreenSize.xl : 3,
                //               },
                //               children: [
                //                 ResponsiveRow(
                //                   children: [
                //                     Text(
                //
                //                       'O que não fazer',
                //                       textAlign: TextAlign.start,
                //                     ),
                //
                //                   ],
                //                 ),
                //                 ResponsiveRow(
                //                   children: [
                //                     Text(
                //                       ' Coçar ou retirar a cicatrização.'
                //                           ' Esfreguar a toalha na tattoo ao secar-se.'
                //                           ' Tomar banho de mar, piscina ou sauna por 20 dias.'
                //                           ' Expor a área tatuada ao sol.'
                //                           ' Ingerir carne suína, frutos do mar e gordurosos em execesso.',
                //                       textAlign: TextAlign.center,
                //                     )
                //                   ],
                //                 ),
                //               ],
                //             ),
                //
                //             ResponsiveCol(
                //               gridSizes: {
                //                 ScreenSize.xl : 3,
                //               },
                //               children: [
                //                 ResponsiveRow(
                //                   children: [
                //                     Text(
                //                       'O que não fazer',
                //                       textAlign: TextAlign.start,
                //                     ),
                //
                //                   ],
                //                 ),
                //                 ResponsiveRow(
                //                   children: [
                //                     Text(
                //                       ' Coçar ou retirar a cicatrização.'
                //                           ' Esfreguar a toalha na tattoo ao secar-se.'
                //                           ' Tomar banho de mar, piscina ou sauna por 20 dias.'
                //                           ' Expor a área tatuada ao sol.'
                //                           ' Ingerir carne suína, frutos do mar e gordurosos em execesso.',
                //                       textAlign: TextAlign.center,
                //                     )
                //                   ],
                //                 ),
                //               ],
                //             ),
                //             ResponsiveCol(
                //               gridSizes: {
                //                  ScreenSize.xl : 3,
                //               },
                //               children: [
                //                 ResponsiveRow(
                //                   children: [
                //                     Text(
                //                       'O que não fazer',
                //                       textAlign: TextAlign.start,
                //                     ),
                //
                //                   ],
                //                 ),
                //                 ResponsiveRow(
                //                   children: [
                //                     Text(
                //                       ' Coçar ou retirar a cicatrização.'
                //                           ' Esfreguar a toalha na tattoo ao secar-se.'
                //                           ' Tomar banho de mar, piscina ou sauna por 20 dias.'
                //                           ' Expor a área tatuada ao sol.'
                //                           ' Ingerir carne suína, frutos do mar e gordurosos em execesso.',
                //                       textAlign: TextAlign.center,
                //                     )
                //                   ],
                //                 ),
                //               ],
                //             ),
                //             ResponsiveCol(
                //               gridSizes: {
                //                 ScreenSize.xl : 3,
                //               },
                //               children: [
                //                 ResponsiveRow(
                //                   children: [
                //                     Text(
                //                       'O que não fazer',
                //                       textAlign: TextAlign.start,
                //                     ),
                //
                //                   ],
                //                 ),
                //                 ResponsiveRow(
                //                   children: [
                //                     Text(
                //                       ' Coçar ou retirar a cicatrização.'
                //                           ' Esfreguar a toalha na tattoo ao secar-se.'
                //                           ' Tomar banho de mar, piscina ou sauna por 20 dias.'
                //                           ' Expor a área tatuada ao sol.'
                //                           ' Ingerir carne suína, frutos do mar e gordurosos em execesso.',
                //                       textAlign: TextAlign.center,
                //                     )
                //                   ],
                //                 ),
                //               ],
                //             ),
                //
                //
                //           ],
                //
                //
                //
                //
                //
                //
                //
                //
                //
                //         )
                //
                //         //
                //         //   ResponsiveRow(
                //         // //    mainAxisAlignment: MainAxisAlignment.start,
                //         //     alignment: Alignment.topLeft,
                //         //     padding: EdgeInsets.symmetric(horizontal: 50),
                //         //     children: [
                //         //       ResponsiveCol(
                //         //    //     mainAxisAlignment: MainAxisAlignment.start,
                //         //
                //         //         children: [
                //         //           Text(
                //         //               '\n\nO que não fazer\n',
                //         //             textAlign: TextAlign.start,
                //         //           ),
                //         //           Text(' Coçar ou retirar a cicatrização.\n'
                //         //               ' Esfreguar a toalha na tattoo ao secar-se.\n'
                //         //               ' Tomar banho de mar, piscina ou sauna por 20 dias.\n'
                //         //               ' Expor a área tatuada ao sol.\n'
                //         //               ' Ingerir carne suína, frutos do mar e gordurosos em execesso.',
                //         //             textAlign: TextAlign.center,
                //         //           )
                //         //         ],
                //         //       ),
                //         //       ResponsiveCol(
                //         //       //  mainAxisAlignment: MainAxisAlignment.start,
                //         //         children: [
                //         //           Text(
                //         //             '\n\nComo cuidar\n',
                //         //             textAlign: TextAlign.start,
                //         //           ),
                //         //           Text('  Com as mãos limpas, aplicar uma fina camada de creme\n'
                //         //               ' cicatrizante indicado pelo seu tatuador,\n'
                //         //               ' no mínimo 3 vezes ao dia.\n'
                //         //               ' Use tecidos leves que não grudam na pele,\n'
                //         //               ' evitando atritos.',
                //         //             textAlign: TextAlign.center,
                //         //           )
                //         //         ],
                //         //       ),
                //         //       ResponsiveCol(
                //         //      //   mainAxisAlignment: MainAxisAlignment.start,
                //         //         children: [
                //         //           Text(
                //         //             '\n\nBoas práticas\n',
                //         //             textAlign: TextAlign.start,
                //         //           ),
                //         //           Text(' Evite exercícios físicos no local da tatuagem.\n'
                //         //               ' Troque o papel filme no prazo de 2 horas,\n'
                //         //               ' lavando com água e sabonete antisséptico.\n'
                //         //               ' \n'
                //         //               ' \n'
                //         //               ' Não aceite conselhos de pessoas leigas no assunto.',
                //         //             textAlign: TextAlign.center,
                //         //           )
                //         //         ],
                //         //       ),
                //         //     ],
                //         //   ),
                //         //
                //       ],
                //     ),
                //
                // ),


             //   Spacer(),

                //TODO RODA PÉ

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

              ])),
    );
  }
}
