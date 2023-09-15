import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetStorageController extends GetxController implements GetxService {
  final box = GetStorage();

  Future<void> initStorage() async {
    await GetStorage().initStorage;
  }


  bool isHavingData = false;

  toggleIsHavingData(bool value) {
    isHavingData = value;
    update();
  }

  String? writeStorage({required String key, required String value}) {
    box.write(key, value);
    toggleIsHavingData(true);
    return null;
  }

  String? readStorage(String key) {
    return box.read(key);
  }

  Future<void> removeGetStorage() async {
    await box.erase();

  }

  Future<void> removeStorage() async {
    await box.erase().then((value) async {
      toggleIsHavingData(false);
      update();
    });
  }

}
