import 'package:flutter/material.dart';
import 'package:prueba_api_rest/Mascotas/Model/mascota_model.dart';
import 'package:prueba_api_rest/Mascotas/Repository/agregar_mascota.dart';
import 'package:prueba_api_rest/Mascotas/Repository/edit_mascota.dart';
import 'package:prueba_api_rest/Mascotas/Views/home_mascotas.dart';

class AddMascotaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _textControllerId = TextEditingController(text: "");
    TextEditingController _textControllerNombre =
        TextEditingController(text: "");
    TextEditingController _textControllerTipo = TextEditingController(text: "");
    TextEditingController _textControllerIdDuenio =
        TextEditingController(text: "");
    TextEditingController _textControllerIdCita =
        TextEditingController(text: "");
    TextEditingController _textControllerIdMedicamento =
        TextEditingController(text: "");
    TextEditingController _textControllerFechaIngreso =
        TextEditingController(text: "");
    TextEditingController _textControllerRazon =
        TextEditingController(text: "");
    return MaterialApp(
      title: "Agregar mascota",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Editar"),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(17),
              child: TextField(
                controller: _textControllerId,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.grey[300],
                    filled: true,
                    hintText: "Mascota Id"),
              ),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: TextField(
                controller: _textControllerNombre,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.grey[300],
                    filled: true,
                    hintText: "Nombre de mascota"),
              ),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: TextField(
                  controller: _textControllerTipo,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: "Tipo de mascota")),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: TextField(
                  controller: _textControllerIdDuenio,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: "Id del dueño")),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: TextField(
                  controller: _textControllerIdCita,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: "Id de cita")),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: TextField(
                  controller: _textControllerIdMedicamento,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: "Id de medicamento")),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: TextField(
                  controller: _textControllerFechaIngreso,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: "Fecha de ingreso")),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: TextField(
                  controller: _textControllerRazon,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: "Razon")),
            ),
            ElevatedButton(
              onPressed: () {
                AddMascotaStep(
                    int.parse(_textControllerId.text),
                    _textControllerNombre.text,
                    _textControllerTipo.text,
                    _textControllerIdDuenio.text,
                    _textControllerIdCita.text,
                    _textControllerIdMedicamento.text,
                    _textControllerFechaIngreso.text,
                    _textControllerRazon.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListMascotas(),
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
