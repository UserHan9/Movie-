class TopAnimeResponse {
  final List<Anime> data;

  TopAnimeResponse({required this.data});

  factory TopAnimeResponse.fromJson(Map<String, dynamic> json) {
    return TopAnimeResponse(
      data: (json['data'] as List)
          .map((e) => Anime.fromJson(e))
          .toList(),
    );
  }
}

class Anime {
  final String title;
  final String type;
  final int? episodes;
  final double? score;
  final int rank;
  final String imageUrl;

  Anime({
    required this.title,
    required this.type,
    this.episodes,
    this.score,
    required this.rank,
    required this.imageUrl,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      title: json['title']?.toString() ?? 'No Title',
      type: json['type']?.toString() ?? '-',
      episodes: json['episodes'],
      score: (json['score'] as num?)?.toDouble(),
      rank: json['rank'] ?? 0,
      imageUrl:
          json['images']?['jpg']?['image_url']?.toString() ?? '',
    );
  }
}
