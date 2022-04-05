import 'package:flutter/material.dart';
import 'package:prueba_api_rest/Citas/Views/home_citas.dart';

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
          actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListCitas(),
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
                    margin: EdgeInsets.only(right:320),
                    child: const Text("ID CITA", style: TextStyle(
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
                          hintText: "Ingresa Id")),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right:325),
                    child: const Text("FECHA", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ))
                  ),
                  TextField(
                      controller: _textControllerFecha,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          filled: true,
                          hintText: "Ingresa fecha")),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right:330),
                    child: const Text("HORA", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ))
                  ),
                  TextField(
                      controller: _textControllerHora,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          filled: true,
                          hintText: "Ingresa hora")),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right:310),
                    child: const Text("SERVICIO", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ))
                  ),
                  TextField(
                      controller: _textControllerTipoServicio,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          filled: true,
                          hintText: "Ingresa tipo de servicio")),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 50, right:50,),
              child: ElevatedButton(
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
                child: const Text("Agregar", style: TextStyle(fontSize:18)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
