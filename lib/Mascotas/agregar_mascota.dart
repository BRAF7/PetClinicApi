
import 'package:prueba_api_rest/Mascotas/Model/mascota_model.dart';

import 'Repository/list_mascotas_repository.dart';
import 'Repository/mascota_repository.dart';
import '../controller/mascotas_controller.dart';

void main() async {

  MascotaModel mascota = MascotaModel(1, "Maria", "Gatito negro", "1", "1", "1", "04/04/22", "Dolor de patita");

  var listMascotaController = MascotaController(ListMascotasRepository());

  var result = await listMascotaController.addMascota(mascota);
}

