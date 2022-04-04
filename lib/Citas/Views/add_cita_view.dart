import 'package:flutter/material.dart';
import 'package:prueba_api_rest/Citas/Views/main.dart';

import '../Repository/agregar_citas.dart';




class AddCitasView extends StatelessWidget {
  const AddCitasView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textControllerId = TextEditingController(text: "");
    TextEditingController _textControllerFecha =
        TextEditingController(text: "");
    TextEditingController _textControllerHora =
        TextEditingController(text: "");
    TextEditingController _textControllerTipoServicio =
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
                  controller: _textControllerFecha,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: "Ingresa fecha")),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: TextField(
                  controller: _textControllerHora,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: "Ingresa hora")),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: TextField(
                  controller: _textControllerTipoServicio,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: "Ingresa tipo de servicio")),
            ),
            ElevatedButton(
              onPressed: () {
                addCita(
                  _textControllerId.text,
                  _textControllerFecha.text,
                  _textControllerHora.text,
                  _textControllerTipoServicio.text,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListCitas(),
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
