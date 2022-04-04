import 'package:flutter/material.dart';
import 'package:prueba_api_rest/Mascotas/Model/mascota_model.dart';
import 'package:prueba_api_rest/Mascotas/Repository/edit_mascota.dart';
import 'package:prueba_api_rest/Mascotas/Views/home_mascotas.dart';

class EditMascota extends StatelessWidget {
  MascotaModel? model;
  EditMascota(this.model);
  int? idMascota;
  String? nombre;
  String? tipo;
  String? idDuenio;
  String? idCita;
  String? idMedicamento;
  String? fechaIngreso;
  String? razon;
  @override
  Widget build(BuildContext context) {
    TextEditingController _textControllerId =
        TextEditingController(text: model?.idMascota.toString());
    TextEditingController _textControllerNombre =
        TextEditingController(text: model?.nombre);
    TextEditingController _textControllerTipo =
        TextEditingController(text: model?.tipo);
    TextEditingController _textControllerIdDuenio =
        TextEditingController(text: model?.idDuenio);
    TextEditingController _textControllerIdCita =
        TextEditingController(text: model?.idCita);
    TextEditingController _textControllerIdMedicamento =
        TextEditingController(text: model?.idMedicamento);
    TextEditingController _textControllerFechaIngreso =
        TextEditingController(text: model?.fechaIngreso);
    TextEditingController _textControllerRazon =
        TextEditingController(text: model?.razon);
    return MaterialApp(
      title: "Pruebas de Dueño",
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
                      hintText: model?.idDuenio.toString())),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: TextField(
                  controller: _textControllerNombre,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: model?.nombre)),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: TextField(
                  controller: _textControllerTipo,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: model?.tipo)),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: TextField(
                  controller: _textControllerIdDuenio,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: model?.idDuenio)),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: TextField(
                  controller: _textControllerIdCita,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: model?.idCita)),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: TextField(
                  controller: _textControllerIdMedicamento,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: model?.idMedicamento)),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: TextField(
                  controller: _textControllerFechaIngreso,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: model?.fechaIngreso)),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: TextField(
                  controller: _textControllerRazon,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: model?.razon)),
            ),
            ElevatedButton(
              onPressed: () {
                EditMascotaStep(
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
