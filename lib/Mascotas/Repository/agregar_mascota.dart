import 'package:prueba_api_rest/Mascotas/Model/mascota_model.dart';

import 'list_mascotas_repository.dart';
import 'mascota_repository.dart';
import '../../controller/mascotas_controller.dart';

void AddMascotaStep(idMascota, nombre, tipo, idDuenio, idCita, idMedicamento,
    fechaIngreso, razon) async {
      
  MascotaModel mascota = MascotaModel(idMascota, nombre, tipo, idDuenio, idCita,
      idMedicamento, fechaIngreso, razon);

  var listMascotaController = MascotaController(ListMascotasRepository());

  var result = await listMascotaController.addMascota(mascota);
}
