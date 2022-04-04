import 'package:prueba_api_rest/Mascotas/Model/mascota_model.dart';
import '../../controller/mascotas_controller.dart';
import 'Repository/list_mascotas_repository.dart';

void main() async {
  int? idMascota = 5;
  String? nombre = "Teresa";
  String? tipo = "Gatito menos negrito";
  String? idDuenio = "1";
  String? idCita = "1";
  String? idMedicamento = "1";
  String? fechaIngreso = "04/04/2022";
  String? razon = "Le duelen las dos patitas";

  MascotaModel mascota = MascotaModel(idMascota, nombre, tipo, idDuenio, idCita,
      idMedicamento, fechaIngreso, razon);

  var listMascotaController = MascotaController(ListMascotasRepository());

  var result = await listMascotaController.editMascota(mascota);
}
