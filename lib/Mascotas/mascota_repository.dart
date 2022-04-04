import 'mascota_model.dart';

abstract class MascotaRepository{
  Future<List<MascotaModel>> getMascotaModelList();
  Future<List<MascotaModel>> updateOwnerList();
  Future<List<MascotaModel>> postMascotaModelList(MascotaModel mascota);
  Future<List<MascotaModel>> addMascota(MascotaModel mascota);
  Future<String> deleteMascotaModelList(MascotaModel mascota); 
}