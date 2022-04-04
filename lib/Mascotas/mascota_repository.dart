import 'mascota_model.dart';

abstract class MascotaRepository{
  Future<List<MascotaModel>> getMascotaModelList();
  Future<List<MascotaModel>> updateOwnerList();
  Future<List<MascotaModel>> postMascotaModelList(MascotaModel owner);
  Future<String> deleteMascotaModelList(MascotaModel owner); 
}