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
      title: "Editar Mascotas",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Editar"),
          actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListMascotas(),
            ),
          );
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ],
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(17),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right:270),
                    child: const Text("ID MASCOTAS", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ))
                  ),
                  TextField(
                      controller: _textControllerId,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          filled: true,
                          hintText: model?.idDuenio.toString())),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right:300),
                    child: const Text("NOMBRE", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ))
                  ),
                  TextField(
                      controller: _textControllerNombre,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          filled: true,
                          hintText: model?.nombre)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right:240),
                    child: const Text("TIPO DE MASCOTA", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ))
                  ),
                  TextField(
                      controller: _textControllerTipo,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          filled: true,
                          hintText: model?.tipo)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right:270),
                    child: const Text("ID DEL DUEÑO", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ))
                  ),
                  TextField(
                      controller: _textControllerIdDuenio,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          filled: true,
                          hintText: model?.idDuenio)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right:295),
                    child: const Text("ID DE CITA", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ))
                  ),
                  TextField(
                      controller: _textControllerIdCita,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          filled: true,
                          hintText: model?.idCita)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right:215),
                    child: const Text("ID DE MEDICAMENTOS", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ))
                  ),
                  TextField(
                      controller: _textControllerIdMedicamento,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          filled: true,
                          hintText: model?.idMedicamento)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right:320),
                    child: const Text("FECHA", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ))
                  ),
                  TextField(
                      controller: _textControllerFechaIngreso,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          filled: true,
                          hintText: model?.fechaIngreso)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right:315),
                    child: const Text("RAZÓN", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ))
                  ),
                  TextField(
                      controller: _textControllerRazon,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          filled: true,
                          hintText: model?.razon)),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 50, right:50,),
              child: ElevatedButton(
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
                child: const Text("Editar",style: TextStyle(fontSize:18)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
