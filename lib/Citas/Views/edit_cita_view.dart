import 'package:flutter/material.dart';
import 'package:prueba_api_rest/Citas/Repository/edit_citas.dart';
import 'package:prueba_api_rest/Citas/Views/main.dart';

import '../Model/cita_model.dart';
import '../Repository/agregar_citas.dart';

class EditCitasView extends StatelessWidget {
  CitaModel? model;
  EditCitasView(this.model);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textControllerId = TextEditingController(
      text: model?.idCita.toString(),
    );
    TextEditingController _textControllerFecha =
        TextEditingController(text: model?.fecha);
    TextEditingController _textControllerHora =
        TextEditingController(text: model?.hora);
    TextEditingController _textControllerTipoServicio =
        TextEditingController(text: model?.tipoServicio);
    return MaterialApp(
      title: "Citas",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Editar"),
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
                EditCitaStep(
                  int.parse(_textControllerId.text),
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
