import '../../../controller/mascotas_controller.dart';
import 'list_owner_repository.dart';
import 'owner_model.dart';
import '../controller/list_owner_controller.dart';


void main() async {
  int? idDuenio = 31;
  String? nombre = "Ranma";
  String? telefono = "555";
  String? direccion = "Hanna Montana" ;
  String? email = "ranma1/2@gmail.com";

  ListOwner owner = ListOwner(idDuenio, nombre, telefono, direccion, email);

  var listOwnerController = ListOwnerController(ListOwnerRepository());

  var result = await listOwnerController.editListOwner(owner);
}
