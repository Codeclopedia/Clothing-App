import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

class OpeningPageGetController extends GetxController {
  RxList<String> allDownloadUrls = <String>[].obs;
  RxInt activeindex = 0.obs;

  Future<void> listfiles() async {
    await FirebaseStorage.instance.ref().listAll().then((value) {
      value.items.forEach((item) async {
        await item.getDownloadURL().then((url) {
          allDownloadUrls.add(url);
        });
      });
    });
  }

  @override
  void onInit() async {
    super.onInit();
    await listfiles();
  }
}
