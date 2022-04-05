import 'package:flutter/material.dart';
import 'package:prueba_api_rest/Duenno/Views/home_duennos.dart';

import '../Model/owner_model.dart';
import '../Repository/edit_duenno.dart';

class EditOwner extends StatelessWidget {
  ListOwner? model;
  EditOwner(this.model);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textControllerId =
        TextEditingController(text: model?.idDuenio.toString());
    TextEditingController _textControllerNombre =
        TextEditingController(text: model?.nombre);
    TextEditingController _textControllerTelefono =
        TextEditingController(text: model?.telefono);
    TextEditingController _textControllerDireccion =
        TextEditingController(text: model?.direccion);
    TextEditingController _textControllerEmail =
        TextEditingController(text: model?.email);
    return MaterialApp(
      title: "Pruebas de Dueño",
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
              builder: (context) => ListOwnersView(),
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
                    margin: EdgeInsets.only(right:295),
                    child: const Text("ID DUEÑOS", style: TextStyle(
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
                    margin: EdgeInsets.only(right:310),
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
                    margin: EdgeInsets.only(right:300),
                    child: const Text("TELÉFONO", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ))
                  ),
                  TextField(
                      controller: _textControllerTelefono,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          filled: true,
                          hintText: model?.telefono)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right:295),
                    child: const Text("DIRECCIÓN", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ))
                  ),
                  TextField(
                      controller: _textControllerDireccion,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          filled: true,
                          hintText: model?.direccion)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(17),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right:330),
                    child: const Text("EMAIL", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ))
                  ),
                  TextField(
                      controller: _textControllerEmail,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          filled: true,
                          hintText: model?.email)),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 50, right:50,),
              child: ElevatedButton(
                onPressed: () {
                  editOwner(
                      int.parse(_textControllerId.text),
                      _textControllerNombre.text,
                      _textControllerTelefono.text,
                      _textControllerDireccion.text,
                      _textControllerEmail.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListOwnersView(),
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
