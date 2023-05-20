import 'package:animate_do/animate_do.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: contador());
  }
}

class contador extends StatefulWidget {
  const contador({super.key});

  @override
  State<contador> createState() => _contadorState();
}

class _contadorState extends State<contador> {
  late AnimationController animacionSalidaNoti;
  late int numero = 0;
  int? botom;
  var noti = false;
  var colorFondo = Color.fromARGB(10, 0, 146, 32);

  var color = Color.fromARGB(255, 0, 146, 32);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: const Text('Enrique Sebastian Mera Yela'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              child: Center(
                  child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BounceInDown(
                        duration: Duration(seconds: 1),
                        child: Text(
                          "el numero es: $numero",
                          style: TextStyle(
                            fontSize: 50,
                          ),
                        )),
                    BounceInLeft(
                        duration: Duration(seconds: 1),
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage("assets/u.jpg"),
                          ),
                        ))
                  ],
                ),
              )),
            ),
            BounceInDown(
                child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 30, 30),
                  child: FloatingActionButton(
                      backgroundColor: color,
                      onPressed: () {
                        setState(() {
                          numero = 0;
                        });
                      },
                      child: Icon(
                        BootstrapIcons.recycle,
                        color: Colors.white,
                      ))),
            )),
            BounceInDown(
                child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 30),
                  child: FloatingActionButton(
                      backgroundColor: color,
                      onPressed: () {
                        setState(() {
                          noti = true;
                        });
                      },
                      child: Icon(
                        BootstrapIcons.bell_fill,
                        color: Colors.white,
                      ))),
            )),
            Visibility(
                visible: noti,
                child: FadeInDownBig(
                  controller: (animatione) => animacionSalidaNoti = animatione,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: colorFondo,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Text(
                                          "HOLA SOY UNA NOTIFICACION Y TU NUMERO ES $numero"),
                                      SizedBox(height: 20),
                                      BootstrapButton(
                                        child: Text("Salir"),
                                        type: BootstrapButtonType.danger,
                                        onPressed: () {
                                          animacionSalidaNoti.reverse();

                                          noti = false;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          onTap: (int botomIndex) {
            setState(() {
              botom =
                  botomIndex; // Actualiza el índice del elemento seleccionado

              if (botom == 0) {
                if (numero >= 1) {
                  numero = numero - 1;
                }
              }
              if (botom == 1) {
                numero = numero + 1;
              }
            });
          },
          backgroundColor: color,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(BootstrapIcons.bookmark_dash_fill),
              label: "Restar 1",
            ),
            BottomNavigationBarItem(
              icon: Icon(BootstrapIcons.patch_plus),
              label: "Sumar 1",
            ),
            // Agrega más elementos según sea necesario
          ],
          unselectedIconTheme: const IconThemeData(
              color: Color.fromARGB(255, 255, 255, 255)), //iconos de otro color
          unselectedItemColor: Colors.white, // labels de otro color
        ));
  }
}
