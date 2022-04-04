import 'package:flutter/material.dart';

import '../Model/cita_model.dart';
import '../Repository/list_citas_repository.dart';
import 'add_cita_view.dart';
import '../../controller/citas_controller.dart';
import 'edit_cita_view.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Dueños',
      home: ListCitas(),
    ),
  );
}

class ListCitas extends StatefulWidget {
  ListCitas({Key? key}) : super(key: key);

  @override
  State<ListCitas> createState() => _ListCitasState();
}

class _ListCitasState extends State<ListCitas> {
  @override
  Widget build(BuildContext context) {
    var listOwnerController = CitaController(ListCitasRepository());

    listOwnerController.fetchListCita();

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
      body: FutureBuilder<List<CitaModel>>(
        future: listOwnerController.fetchListCita(),
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
                      Expanded(flex: 1, child: Text("${listOwners?.fecha}")),
                      Expanded(flex: 2, child: Text("${listOwners?.hora}")),
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
                                        EditCitasView(listOwners),
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
                                      .deleteListCita(listOwners!)
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
              builder: (context) => AddCitasView(),
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
