class Project {
  final String id;
  final String title;
  final String role;
  final String description;
  final List<String> technologies;
  final String liveLink;
  final String sourceLink;
  final String imageUrl;
  final String challenge;

  Project({
    required this.id,
    required this.title,
    required this.role,
    required this.description,
    required this.technologies,
    required this.liveLink,
    required this.sourceLink,
    required this.imageUrl,
    required this.challenge,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      title: json['title'],
      role: json['role'],
      description: json['description'],
      technologies: List<String>.from(json['technologies']),
      liveLink: json['liveLink'],
      sourceLink: json['sourceLink'],
      imageUrl: json['imageUrl'],
      challenge: json['challenge'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'role': role,
      'description': description,
      'technologies': technologies,
      'liveLink': liveLink,
      'sourceLink': sourceLink,
      'imageUrl': imageUrl,
      'challenge': challenge,
    };
  }
}