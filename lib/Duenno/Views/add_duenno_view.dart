import 'package:flutter/material.dart';
import 'package:prueba_api_rest/Duenno/Repository/add_main.dart';

import 'home_duennos.dart';


class AddOwner extends StatelessWidget {
  const AddOwner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textControllerId = TextEditingController(text: "");
    TextEditingController _textControllerNombre =
        TextEditingController(text: "");
    TextEditingController _textControllerTelefono =
        TextEditingController(text: "");
    TextEditingController _textControllerDireccion =
        TextEditingController(text: "");
    TextEditingController _textControllerEmail =
        TextEditingController(text: "");
    return MaterialApp(
      title: "Pruebas de Dueño",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Agregar"),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(17),
              child: TextField(
                  controller: _textControllerId,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: "Ingresa Id")),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: TextField(
                  controller: _textControllerNombre,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: "Ingresa nombre")),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: TextField(
                  controller: _textControllerTelefono,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: "Ingresa telefono")),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: TextField(
                  controller: _textControllerDireccion,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: "Ingresa direccion")),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: TextField(
                  controller: _textControllerEmail,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: "Ingresa email")),
            ),
            ElevatedButton(
              onPressed: () {
                addOwner(
                  int.parse(_textControllerId.text),
                  _textControllerNombre.text,
                  _textControllerTelefono.text,
                  _textControllerDireccion.text,
                  _textControllerEmail.text,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListOwnersView(),
                  ),
                );
              },
              child: const Text("Agregar"),
            )
          ],
        ),
      ),
    );
  }
}
