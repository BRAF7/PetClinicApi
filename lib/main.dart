import 'package:flutter/material.dart';
import 'package:prueba_api_rest/Home/home.dart';
import 'package:prueba_api_rest/Mascotas/Views/home_mascotas.dart';
import 'package:prueba_api_rest/Login/login.dart';
import 'package:prueba_api_rest/Duenno/Views/home_duennos.dart';
import 'package:prueba_api_rest/Citas/Views/home_citas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/home': (context) => const Home(),
        '/home_mascotas': (context) => ListMascotas(),
        '/home_duenios': (context) => ListOwnersView(),
        '/home_citas': (context) => ListCitas(),

      },
    );
  }
}