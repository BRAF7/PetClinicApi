import 'package:prueba_api_rest/Duenno/list_owner_repository.dart';
import 'package:prueba_api_rest/controller/list_owner_controller.dart';


import 'owner_model.dart';


void main() async {
  Type list_owner_repository = ListOwnerRepository;

  ListOwner owner = ListOwner(1, "Brian Tadeo", "999999","Suchiapa","brian@brian1.com");

  var listCitaController = ListOwnerController(ListOwnerRepository());
  print(owner.nombre);
  var result = await listCitaController.addListOwner(owner);
}