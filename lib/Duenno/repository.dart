import 'owner_model.dart';

abstract class Repository{
  Future<List<ListOwner>> getListOwnerList();
  Future<List<ListOwner>> postListOwnerList(ListOwner owner);
  Future<String> editOwnerList(ListOwner owner);
  Future<List<ListOwner>> addOwnerList(ListOwner owner);
  Future<String> deleteListOwnerList(ListOwner owner); 
}