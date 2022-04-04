

import 'package:prueba_api_rest/Citas/cita_model.dart';
import 'package:prueba_api_rest/Citas/citas_repository.dart';

class CitaController{
  final CitasRepository _repository;

  CitaController(this._repository);

  Future<List<CitaModel>> fetchListCita() async {
    return _repository.getCitaList();
  }

  Future<String> deleteListCita(CitaModel model) async {
    return _repository.deleteCitaList(model);
  }

   Future<List<CitaModel>> addCita(CitaModel model) async {
    return _repository.addCita(model);
  }
}