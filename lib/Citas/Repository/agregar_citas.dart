import 'package:prueba_api_rest/Citas/Model/cita_model.dart';
import 'list_citas_repository.dart';
import '../../controller/citas_controller.dart';





void addCita(idCita, fecha, hora, tipoServicio) async {

  CitaModel cita = CitaModel(int.parse(idCita), fecha, hora, tipoServicio);

  var listCitaController = CitaController(ListCitasRepository());
  var result = await listCitaController.addCita(cita);
}

