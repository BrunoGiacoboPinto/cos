abstract interface class CosServiceAccess<T> {
  Future<T?> getData({required String key});
}

abstract class CosServiceReadWriteAccess<T> extends CosServiceAccess<T> {
  Future<void> saveData({required T data, required String key});
  Future<bool> hasData({required String key});
  Future<Map<String, T>> getAllData();
}
