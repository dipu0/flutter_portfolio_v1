import 'package:flutter/material.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/models/job_experience.dart';

class PortfolioViewModel extends ChangeNotifier {
  final List<Project> _projects = [
    Project(
      id: '1',
      title: 'E-commerce App',
      role: 'Lead Developer',
      description: 'A full-featured e-commerce application with product browsing, cart management, checkout, and payment processing.',
      technologies: ['Flutter', 'Firebase', 'Stripe API', 'Provider'],
      liveLink: 'https://play.google.com/store',
      sourceLink: 'https://github.com/dipu0/ecommerce-app',
      imageUrl: 'https://via.placeholder.com/800x400?text=E-commerce+App',
      challenge: 'Implementing complex state management across deep navigation hierarchies.',
    ),
    Project(
      id: '2',
      title: 'Fitness Tracker',
      role: 'Solo Developer',
      description: 'A fitness tracking application that allows users to record workouts, track progress, and set goals with visual data representations.',
      technologies: ['Flutter', 'SQLite', 'Charts', 'BLoC Pattern'],
      liveLink: 'https://play.google.com/store',
      sourceLink: 'https://github.com/dipu0/fitness-tracker',
      imageUrl: 'https://via.placeholder.com/800x400?text=Fitness+Tracker',
      challenge: 'Creating interactive charts that respond to user input and animate smoothly.',
    ),
    Project(
      id: '3',
      title: 'Social Media Platform',
      role: 'Frontend Developer',
      description: 'A social media platform that enables users to share posts, follow friends, and engage with content through likes and comments.',
      technologies: ['Flutter', 'GraphQL', 'Riverpod', 'WebSockets'],
      liveLink: 'https://play.google.com/store',
      sourceLink: 'https://github.com/dipu0/social-media',
      imageUrl: 'https://via.placeholder.com/800x400?text=Social+Media+Platform',
      challenge: 'Implementing real-time updates for feeds and notifications using WebSockets.',
    ),
    Project(
      id: '4',
      title: 'Task Management App',
      role: 'Full Stack Developer',
      description: 'A comprehensive task management solution with projects, tasks, subtasks, and team collaboration features.',
      technologies: ['Flutter', 'Firebase', 'Cloud Functions', 'GetX'],
      liveLink: 'https://play.google.com/store',
      sourceLink: 'https://github.com/dipu0/task-manager',
      imageUrl: 'https://via.placeholder.com/800x400?text=Task+Management+App',
      challenge: 'Building a syncing system that works offline and reconciles conflicts when connection is restored.',
    ),
  ];

  final List<JobExperience> _experiences = [
    JobExperience(
      id: '1',
      company: 'Tech Solutions Inc.',
      role: 'Senior Flutter Developer',
      duration: 'Jan 2021 - Present',
      description: 'Leading the development of multiple mobile applications, mentoring junior developers, and establishing best practices for the mobile team.',
      technologies: ['Flutter', 'Firebase', 'GraphQL', 'CI/CD'],
    ),
    JobExperience(
      id: '2',
      company: 'Mobile Innovations',
      role: 'Flutter Developer',
      duration: 'Mar 2019 - Dec 2020',
      description: 'Developed and maintained several Flutter applications for clients in various industries including e-commerce, healthcare, and fintech.',
      technologies: ['Flutter', 'REST APIs', 'SQLite', 'BLoC Pattern'],
    ),
    JobExperience(
      id: '3',
      company: 'AppStart',
      role: 'Android Developer',
      duration: 'Jun 2017 - Feb 2019',
      description: 'Built native Android applications focusing on performance optimization and consistent user experience across various devices.',
      technologies: ['Java', 'Kotlin', 'Android SDK', 'Room Database'],
    ),
  ];

  List<Project> get projects => _projects;
  List<JobExperience> get experiences => _experiences;
}