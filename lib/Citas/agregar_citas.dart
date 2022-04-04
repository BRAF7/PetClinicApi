import 'package:prueba_api_rest/Citas/cita_model.dart';
import 'list_citas_repository.dart';
import '../controller/list_citas_controller.dart';





void main() async {

  CitaModel cita = CitaModel(1, "04/04/2022", "8:30PM","Chequeo de patita");

  var listCitaController = CitaController(ListCitasRepository());
  var result = await listCitaController.addCita(cita);
}

