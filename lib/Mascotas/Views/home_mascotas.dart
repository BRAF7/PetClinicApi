import 'package:flutter/material.dart';
import 'package:prueba_api_rest/Mascotas/Repository/list_mascotas_repository.dart';
import 'package:prueba_api_rest/Mascotas/Views/add_mascota_view.dart';
import 'package:prueba_api_rest/controller/mascotas_controller.dart';
import 'package:prueba_api_rest/Mascotas/Views/edit_mascota_view.dart';
import 'package:prueba_api_rest/Login/login.dart';
import '../Model/mascota_model.dart';
import '../Repository/edit_mascota.dart';

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
        title: const Text("Mascotas"),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            String DropdownValue=getDropdownValue();
            if (DropdownValue=="Empleado"){
              Navigator.pushReplacementNamed(context, '/home');
            } else {
              Navigator.pushReplacementNamed(context, '/');
            }
            
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
                var listMascotas = snapshot.data?[index];
                return Container(
                  height: 350,
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
                        Expanded(flex: 1, child: Text("ID: ${listMascotas?.idMascota}",style:TextStyle(fontSize: 18))),
                        Expanded(flex: 1, child: Text("NOMBRE: ${listMascotas?.nombre}",style:TextStyle(fontSize: 18))),
                        Expanded(flex: 1, child: Text("TIPO: ${listMascotas?.tipo}",style:TextStyle(fontSize: 18))),
                        Expanded(flex: 1, child: Text("ID DUEÑO: ${listMascotas?.idDuenio}",style:TextStyle(fontSize: 18))),
                        Expanded(flex: 1, child: Text("ID CITAS: ${listMascotas?.idCita}",style:TextStyle(fontSize: 18))),
                        Expanded(flex: 1, child: Text("ID MEDICAMENTO: ${listMascotas?.idMedicamento}",style:TextStyle(fontSize: 18))),
                        Expanded(flex: 1, child: Text("FECHA DE INGRESO: ${listMascotas?.fechaIngreso}",style:TextStyle(fontSize: 18))),
                        Expanded(flex: 1, child: Text("RAZÓN: ${listMascotas?.razon}",style:TextStyle(fontSize: 18))),
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
                                            EditMascota(listMascotas),
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
                                          .deleteMascota(listMascotas!)
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
                return const Divider(thickness: 0.5, height: 0.5);
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
        child: const Icon(Icons.add),
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
      child: Center(child: Text("${title}",style:TextStyle(fontSize: 18))),
    );
  }
}
