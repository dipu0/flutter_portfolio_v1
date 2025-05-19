Here's the enhanced README.md with a detailed deployment section added:

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
- Dart (version 3.7.2 or later)

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

### GitHub Pages Deployment (Recommended)

1. **Enable GitHub Actions**:
   Create a `.github/workflows/deploy.yml` file with this content:

   ```yaml
   name: Deploy to GitHub Pages
   
   on:
     push:
       branches: [ master ]
   
   jobs:
     build-and-deploy:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v4
         - uses: subosito/flutter-action@v2
           with:
             channel: 'stable'
         - run: flutter pub get
         - run: flutter build web --release --base-href /flutter_portfolio_v1_provide/
         - uses: peaceiris/actions-gh-pages@v3
           with:
             github_token: ${{ secrets.GITHUB_TOKEN }}
             publish_dir: ./build/web
             publish_branch: gh-pages
   ```

2. **Configure GitHub Pages**:
   - Go to Repository Settings → Pages
   - Set source to "Deploy from branch"
   - Select `gh-pages` branch and `/ (root)` folder
   - Click Save

3. **Your site will be live at**:
   ```
   https://<your-github-username>.github.io/flutter_portfolio_v1_provide/
   ```

### Firebase Hosting (Alternative)

1. Install Firebase CLI:
   ```bash
   npm install -g firebase-tools
   firebase login
   ```

2. Initialize Firebase:
   ```bash
   firebase init hosting
   ```
   - Select your Firebase project
   - Set `build/web` as public directory
   - Configure as single-page app: Yes
   - Set up automatic builds: No

3. Deploy:
   ```bash
   flutter build web
   firebase deploy
   ```

### Netlify Deployment

1. Connect your GitHub repository to Netlify
2. Set these build settings:
   - Build command: `flutter build web`
   - Publish directory: `build/web`
3. Add environment variable:
   ```
   FLUTTER_WEB_CANVASKIT_URL = /canvaskit/
   ```

## Architecture

This project follows the MVVM (Model-View-ViewModel) architecture:

- **Models**: Data structures for projects, job experiences, and blog posts
- **Views**: UI components for each section
- **ViewModels**: Business logic and state management

## Troubleshooting Deployment

- **404 Errors**: Ensure your `--base-href` matches your repository name
- **Blank Page**: Verify you built with `--release` flag
- **Routing Issues**: Configure your hosting provider to redirect all routes to `index.html`

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## License

This project is licensed under the MIT License - see the LICENSE file for details.