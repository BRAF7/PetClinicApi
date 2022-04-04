import 'package:prueba_api_rest/Mascotas/Model/mascota_model.dart';
import '../../../controller/mascotas_controller.dart';
import 'list_mascotas_repository.dart';

void EditMascotaStep(idMascota, nombre, tipo, idDuenio, idCita, idMedicamento,
    fechaIngreso, razon) async {

  MascotaModel mascota = MascotaModel(idMascota, nombre, tipo, idDuenio, idCita,
      idMedicamento, fechaIngreso, razon);

  var listMascotaController = MascotaController(ListMascotasRepository());

  var result = await listMascotaController.editMascota(mascota);
}
