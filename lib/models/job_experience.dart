class JobExperience {
  final String id;
  final String company;
  final String role;
  final String duration;
  final String description;
  final List<String> technologies;

  JobExperience({
    required this.id,
    required this.company,
    required this.role,
    required this.duration,
    required this.description,
    required this.technologies,
  });

  factory JobExperience.fromJson(Map<String, dynamic> json) {
    return JobExperience(
      id: json['id'],
      company: json['company'],
      role: json['role'],
      duration: json['duration'],
      description: json['description'],
      technologies: List<String>.from(json['technologies']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company': company,
      'role': role,
      'duration': duration,
      'description': description,
      'technologies': technologies,
    };
  }
}