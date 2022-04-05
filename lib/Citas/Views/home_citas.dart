import 'package:flutter/material.dart';

import '../Model/cita_model.dart';
import '../Repository/list_citas_repository.dart';
import 'add_cita_view.dart';
import '../../controller/citas_controller.dart';
import 'edit_cita_view.dart';

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
        title: const Text("Citas"),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');  
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
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
                  height: 250,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 100),
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Expanded(flex: 1, child: Text("ID CITA: ${listOwners?.idCita}",style:TextStyle(fontSize: 18))),
                        Expanded(flex: 1, child: Text("FECHA: ${listOwners?.fecha}",style:TextStyle(fontSize: 18))),
                        Expanded(flex: 1, child: Text("HORA: ${listOwners?.hora}",style:TextStyle(fontSize: 18))),
                        Expanded(flex: 1, child: Text("SERVICIO: ${listOwners?.tipoServicio}",style:TextStyle(fontSize: 18))),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 5, left: 70, right: 20),
                                width: 100,
                                child: InkWell(
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
                                    Colors.greenAccent,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
                                width: 100,
                                child: InkWell(
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
                                    "Delete",
                                    Colors.redAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
      child: Center(child: Text("${title}", style:TextStyle(fontSize: 16))),
    );
  }
}
