import 'package:prueba_api_rest/Duenno/Repository/list_owner_repository.dart';
import 'package:prueba_api_rest/controller/owner_controller.dart';
import 'package:uuid/uuid.dart';
import 'Model/owner_model.dart';

void addOwner(
  int? idDuenio,
  String? nombre,
  String? telefono,
  String? direccion,
  String? email,
) async {
  var uuid = Uuid();
  ListOwner owner = ListOwner(idDuenio, nombre, telefono, direccion, email);

  var listCitaController = ListOwnerController(ListOwnerRepository());
  print(owner.nombre);
  var result = await listCitaController.addListOwner(owner);
}
