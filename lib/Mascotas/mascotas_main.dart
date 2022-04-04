import 'package:flutter/material.dart';
import 'package:prueba_api_rest/Mascotas/list_mascotas_repository.dart';
import 'package:prueba_api_rest/Mascotas/mascota_model.dart';
import 'package:prueba_api_rest/controller/mascotas_controller.dart';
import '../../controller/list_owner_controller.dart';
import '../Duenno/list_owner_repository.dart';
import '../Duenno/owner_model.dart';




void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var listMascotaController = MascotaController(ListMascotasRepository());

    listMascotaController.fetchListMascota();

    return MaterialApp(
      title: "Pruebas de Mascota",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Prueba de Dueño"),
        ),
        body: FutureBuilder<List<MascotaModel>>(
          future: listMascotaController.fetchListMascota(),
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
                    height: 100,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(flex: 1, child: Text("${listMascotas?.nombre}")),
                        Expanded(
                            flex: 2, child: Text("${listMascotas?.tipo}")),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: buildCallContainer(
                                  "patch",
                                  Colors.orangeAccent,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    listMascotaController
                                        .deleteMascota(listMascotas!)
                                        .then((value) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
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
        floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),),
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
