import 'package:prueba_api_rest/Citas/cita_model.dart';

import '../../../controller/mascotas_controller.dart';
import '../controller/list_owner_controller.dart';
import 'Citas/list_citas_repository.dart';
import 'controller/list_citas_controller.dart';

void main() async {
  int? idCita = 23;
  String? fecha = "04/04/2022";
  String? hora = "9:40";
  String? tipoServicio = "super sobada de pancita";

  CitaModel owner = CitaModel(idCita, fecha, hora, tipoServicio);

  var listCitaController = CitaController(ListCitasRepository());

  var result = await listCitaController.editCita(owner);
}
