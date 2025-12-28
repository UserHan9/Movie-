import 'package:get/get.dart';
import '../../../data/model/anime.dart';
import '../../../service/api_service.dart';

class HomeController extends GetxController {
  final ApiService apiService = ApiService();

  var isLoading = false.obs;
  var animeList = <Anime>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTopAnime();
  }

  Future<void> fetchTopAnime() async {
    try {
      isLoading.value = true;
      final result = await apiService.getTopAnime();
      animeList.assignAll(result.data);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
