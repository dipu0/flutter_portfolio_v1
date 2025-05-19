class BlogPost {
  final String id;
  final String title;
  final String excerpt;
  final String link;
  final String publishDate;
  final String? thumbnail;

  BlogPost({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.link,
    required this.publishDate,
    this.thumbnail,
  });

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
      id: json['id'] ?? json['guid'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
      title: json['title'] ?? 'Untitled',
      excerpt: json['description'] ?? json['content'] ?? 'No content available',
      link: json['link'] ?? '',
      publishDate: json['pubDate'] ?? json['published'] ?? DateTime.now().toString(),
      thumbnail: json['thumbnail'] ?? null,
    );
  }
}