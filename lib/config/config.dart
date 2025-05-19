class AppConfig {
  // Personal Information
  static const String name = "MD. ASAD CHOWDHURY DIPU";
  static const String tagline = "Software Engineer | Flutter Developer | IoT Enthusiast";
  static const String shortBio = "I build cross-platform mobile apps with Flutter and IoT solutions with Azure/Firebase.";
  static const String longBio = """
    Passionate Software Engineer with 1+ years of experience in Flutter development and IoT systems.
    Currently working at Polygon Technology as Software Engineer I, developing mobile applications for Android/iOS.
    
    Technical Highlights:
    - Flutter (BLoC, API Integration, Performance Optimization)
    - IoT (Azure, Firebase, Django REST, Heroku)
    - Native Android Development
    - UI/UX Implementation
    
    Leadership:
    - Former President of EWU Robotics Club (250+ members)
    - Organized 10+ workshops/seminars
    - Champion at Itechexpo IUBAT 2022
  """;
  
  // Medium Blog Integration
  static const String mediumUsername = "c.dipu0";
  
  // Social Links
  static const Map<String, String> socialLinks = {
    'github': 'https://github.com/dipu0',
    'linkedin': 'https://linkedin.com/in/md-asad-chowdhury-dipu',
    'twitter': 'https://twitter.com/dipu093',
    'medium': 'https://medium.com/@c.dipu0',
  };
  
  // Resume
  static const String resumeUrl = 'https://example.com/resume.pdf';
  
  // Skills
  static const List<Map<String, dynamic>> skills = [
    {'name': 'Flutter/Dart', 'level': 0.90},
    {'name': 'Android', 'level': 0.85},
    {'name': 'Firebase', 'level': 0.85},
    {'name': 'Azure IoT', 'level': 0.75},
    {'name': 'Django REST', 'level': 0.70},
    {'name': 'BLoC Pattern', 'level': 0.80},
    {'name': 'API Integration', 'level': 0.85},
    {'name': 'UI/UX', 'level': 0.80},
  ];
  // Services
  static const List<Map<String, String>> services = [
    {
      'title': 'Mobile Development',
      'description': 'Building cross-platform apps with Flutter for Android/iOS with clean architecture.',
      'icon': 'mobile',
    },
    {
      'title': 'IoT Solutions',
      'description': 'Developing cloud-based IoT systems using Azure, Firebase and Heroku.',
      'icon': 'cpu',
    },
    {
      'title': 'API Integration',
      'description': 'Connecting apps with backend services through RESTful APIs.',
      'icon': 'database',
    },
    {
      'title': 'Tech Leadership',
      'description': 'Mentoring teams based on Robotics Club leadership experience.',
      'icon': 'users',
    },
    {
      'title': 'Performance Tuning',
      'description': 'Optimizing app performance and state management.',
      'icon': 'activity',
    },
  ];
}