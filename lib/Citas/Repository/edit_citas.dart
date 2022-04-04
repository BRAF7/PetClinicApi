import 'package:prueba_api_rest/Citas/Model/cita_model.dart';

import '../../../../../controller/mascotas_controller.dart';
import '../../controller/owner_controller.dart';
import 'list_citas_repository.dart';
import '../../controller/citas_controller.dart';

void EditCitaStep(
  int? idCita,
  String? fecha,
  String? hora,
  String? tipoServicio,
) async {
  CitaModel owner = CitaModel(idCita, fecha, hora, tipoServicio);

  var listCitaController = CitaController(ListCitasRepository());

  var result = await listCitaController.editCita(owner);
}
