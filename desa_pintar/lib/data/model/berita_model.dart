class BeritaResult {
  BeritaResult({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Berita> articles;

  factory BeritaResult.fromJson(Map<String, dynamic> json) => BeritaResult(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Berita>.from((json["articles"] as List)
            .map((x) => Berita.fromJson(x))
            .where((article) =>
                article.author != null &&
                article.description != null &&
                article.urlToImage != null &&
                article.publishedAt != null &&
                article.content != null)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Berita {
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  Berita({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Berita.fromJson(Map<String, dynamic> json) => Berita(
        author: json["author"],
        title: json["title"],
        description: json["description"] ?? "-",
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "author": author == null ? null : author,
        "title": title,
        "description": description == null ? null : description,
        "url": url,
        "urlToImage": urlToImage == null ? null : urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content == null ? null : content,
      };
}
