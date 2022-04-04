import 'package:flutter/material.dart';
import 'add_duenno_view.dart';
import '../../controller/owner_controller.dart';
import '../Repository/list_owner_repository.dart';
import '../Model/owner_model.dart';
import 'edit_duenno.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Dueños',
      home: ListOwnersView(),
    ),
  );
}

class ListOwnersView extends StatefulWidget {
  ListOwnersView({Key? key}) : super(key: key);

  @override
  State<ListOwnersView> createState() => _ListOwnersViewState();
}

class _ListOwnersViewState extends State<ListOwnersView> {
  @override
  Widget build(BuildContext context) {
    var listOwnerController = ListOwnerController(ListOwnerRepository());

    listOwnerController.fetchListOwner();

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
                      Expanded(flex: 2, child: Text("${listOwners?.telefono}")),
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
                                        EditTemplate(listOwners),
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
                                      .deleteListOwner(listOwners!)
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
              builder: (context) => AddTemplate(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Scaffold ScaffoldDuenno(
      ListOwnerController listOwnerController, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dueño"),
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
                      Expanded(flex: 2, child: Text("${listOwners?.telefono}")),
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
                                        EditTemplate(listOwners),
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
                                      .deleteListOwner(listOwners!)
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
              builder: (context) => AddTemplate(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  FutureBuilder<List<ListOwner>> HomeOwner(
      ListOwnerController listOwnerController) {
    return FutureBuilder<List<ListOwner>>(
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
                    Expanded(flex: 2, child: Text("${listOwners?.telefono}")),
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
                                      EditTemplate(listOwners),
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
                                    .deleteListOwner(listOwners!)
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
