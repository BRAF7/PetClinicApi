import '../../../../controller/mascotas_controller.dart';
import 'list_owner_repository.dart';
import '../Model/owner_model.dart';
import '../../controller/owner_controller.dart';

void editOwner(
  int? idDuenio,
  String? nombre,
  String? telefono,
  String? direccion,
  String? email,
) async {
  ListOwner owner = ListOwner(idDuenio, nombre, telefono, direccion, email);

  var listOwnerController = ListOwnerController(ListOwnerRepository());

  var result = await listOwnerController.editListOwner(owner);
}
