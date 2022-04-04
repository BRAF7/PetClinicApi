import 'package:flutter/material.dart';
import '../controller/list_owner_controller.dart';
import 'list_owner_repository.dart';
import 'owner_model.dart';



void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var listOwnerController = ListOwnerController(ListOwnerRepository());

    listOwnerController.fetchListOwner();

    return MaterialApp(
      title: "Pruebas de Dueño",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Prueba de Dueño"),
        ),
        body: FutureBuilder<List<ListOwner>>(
          future: listOwnerController.fetchListOwner(),
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
                        Expanded(
                            flex: 2, child: Text("${listOwners?.telefono}")),
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
                                    listOwnerController
                                        .deleteListOwner(listOwners!)
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
