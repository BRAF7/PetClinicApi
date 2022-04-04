import 'owner_model.dart';

abstract class Repository{
  Future<List<ListOwner>> getListOwnerList();
  Future<List<ListOwner>> postListOwnerList(ListOwner owner);
  Future<List<ListOwner>> updateOwnerList(ListOwner owner);
  Future<List<ListOwner>> addOwnerList(ListOwner owner);
  Future<String> deleteListOwnerList(ListOwner owner); 
}