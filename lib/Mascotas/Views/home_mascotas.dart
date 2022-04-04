import 'package:flutter/material.dart';
import 'package:prueba_api_rest/Mascotas/Repository/list_mascotas_repository.dart';
import 'package:prueba_api_rest/Mascotas/Views/add_mascota_view.dart';
import 'package:prueba_api_rest/controller/mascotas_controller.dart';
import 'package:prueba_api_rest/Mascotas/Views/edit_mascota_view.dart';

import '../Model/mascota_model.dart';
import '../Repository/edit_mascota.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Dueños',
      home: ListMascotas(),
    ),
  );
}

class ListMascotas extends StatefulWidget {
  ListMascotas({Key? key}) : super(key: key);

  @override
  State<ListMascotas> createState() => _ListMascotasState();
}

class _ListMascotasState extends State<ListMascotas> {
  @override
  Widget build(BuildContext context) {
    var listOwnerController = MascotaController(ListMascotasRepository());

    listOwnerController.fetchListMascota();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dueño"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder<List<MascotaModel>>(
        future: listOwnerController.fetchListMascota(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          }
          return ListView.separated(
              itemBuilder: (context, index) {
                var listOwners = snapshot.data?[index];
                return Container(
                  height: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Text("${listOwners?.nombre}")),
                      Expanded(flex: 2, child: Text("${listOwners?.razon}")),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditMascota(listOwners),
                                  ),
                                );
                              },
                              child: buildCallContainer(
                                "Edit",
                                Colors.orangeAccent,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  listOwnerController
                                      .deleteMascota(listOwners!)
                                      .then((value) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        duration:
                                            const Duration(milliseconds: 700),
                                        content: Text("${value}"),
                                      ),
                                    );
                                  });
                                });
                              },
                              child: buildCallContainer(
                                "delete",
                                Colors.orangeAccent,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(thickness: 0.5, height: 0.5);
              },
              itemCount: snapshot.data?.length ?? 0);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddMascotaView(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Container buildCallContainer(String title, Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Text("${title}")),
    );
  }
}
