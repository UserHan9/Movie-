import 'package:dio/dio.dart';
import '../data/model/anime.dart';

class ApiService {
  static const String _baseUrl = 'https://api.jikan.moe/v4';

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<TopAnimeResponse> getTopAnime() async {
    try {
      final response = await _dio.get('/top/anime');
      return TopAnimeResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ?? 'Gagal mengambil data',
      );
    }
  }
}
