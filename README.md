# Flutter Developer Portfolio

A professional portfolio website built with Flutter Web, designed to showcase your skills, projects, and services as a Flutter developer.

## Features

- Responsive design for mobile and desktop
- MVVM architecture pattern
- Sections for About, Portfolio, Services, Skills, Blog, and Contact
- Dynamic Medium blog integration
- Theme switching (light/dark mode)
- Smooth animations
- Clean, maintainable code structure

## Getting Started

### Prerequisites

- Flutter SDK (version 3.29.3 or later)
- Dart (version 3.5.2 or later)

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/dipu0/flutter_portfolio_v1_provide.git
   cd flutter_portfolio_v1_provide
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run -d chrome
   ```

## Customization

### Personal Information

Edit the `lib/config/config.dart` file to update your personal information:

- Name
- Tagline
- Bio
- Social links
- Medium username
- Resume URL

### Projects

Update the `PortfolioViewModel` in `lib/view_models/portfolio_view_model.dart` to showcase your own projects:

```dart
Project(
  id: 'project-id',
  title: 'Project Title',
  role: 'Your Role',
  description: 'Project Description',
  technologies: ['Flutter', 'Firebase', 'etc'],
  liveLink: 'https://example.com',
  sourceLink: 'https://github.com/yourusername/project',
  imageUrl: 'https://example.com/image.jpg',
  challenge: 'Challenges faced and how you solved them',
),
```

### Job Experience

Update the `_experiences` list in `lib/view_models/portfolio_view_model.dart`:

```dart
JobExperience(
  id: 'job-id',
  company: 'Company Name',
  role: 'Your Role',
  duration: 'Jan 2021 - Present',
  description: 'Job description',
  technologies: ['Flutter', 'Dart', 'etc'],
),
```

### Services

Edit the `services` list in `lib/config/config.dart` to update the services you offer.

### Skills

Edit the `skills` list in `lib/config/config.dart` to update your technical skills and proficiency levels.

## Deployment

To deploy your portfolio:

1. Build the web app:
   ```bash
   flutter build web --release
   ```

2. Deploy the `build/web` directory to your preferred hosting service (Firebase Hosting, GitHub Pages, Netlify, etc.).

## Architecture

This project follows the MVVM (Model-View-ViewModel) architecture:

- **Models**: Data structures for projects, job experiences, and blog posts
- **Views**: UI components for each section
- **ViewModels**: Business logic and state management

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## License

This project is licensed under the MIT License - see the LICENSE file for details.