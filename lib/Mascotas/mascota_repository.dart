import 'mascota_model.dart';

abstract class MascotaRepository{
  Future<List<MascotaModel>> getMascotaModelList();
  Future<String> editMascota(MascotaModel model);
  Future<List<MascotaModel>> addMascota(MascotaModel mascota);
  Future<String> deleteMascotaModelList(MascotaModel mascota); 
}