

import 'package:prueba_api_rest/Mascotas/mascota_model.dart';
import 'package:prueba_api_rest/Mascotas/mascota_repository.dart';

class MascotaController{
  final MascotaRepository _repository;

  MascotaController(this._repository);

  Future<List<MascotaModel>> fetchListMascota() async {
    return _repository.getMascotaModelList();
  }
  Future<String> deleteMascota(MascotaModel mascota) async {
    return _repository.deleteMascotaModelList(mascota);
  }
  Future<List<MascotaModel>> addMascota(MascotaModel mascota) async {
    return _repository.addMascota(mascota);
  }
}