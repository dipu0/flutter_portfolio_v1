import 'package:flutter/material.dart';
import 'package:portfolio/models/job_experience.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:portfolio/config/config.dart';
import 'package:portfolio/view_models/portfolio_view_model.dart';
import 'package:portfolio/widgets/section_title.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final portfolioViewModel = Provider.of<PortfolioViewModel>(context);
    
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final isMobile = sizingInformation.deviceScreenType == DeviceScreenType.mobile;
        final padding = isMobile ? 24.0 : 48.0;
        
        return Container(
          padding: EdgeInsets.all(padding),
          color: theme.colorScheme.surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: 'About Me'),
              
              const SizedBox(height: 32),
              
              isMobile
                  ? _buildMobileLayout(theme, portfolioViewModel)
                  : _buildDesktopLayout(theme, portfolioViewModel),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileLayout(ThemeData theme, PortfolioViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBio(theme),
        const SizedBox(height: 32),
        _buildExperience(theme, viewModel),
        const SizedBox(height: 32),
        _buildEducation(theme),
      ],
    );
  }

  Widget _buildDesktopLayout(ThemeData theme, PortfolioViewModel viewModel) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: _buildBio(theme),
        ),
        const SizedBox(width: 48),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildExperience(theme, viewModel),
              const SizedBox(height: 32),
              _buildEducation(theme),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBio(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Story',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          AppConfig.longBio,
          style: theme.textTheme.bodyLarge?.copyWith(
            height: 1.6,
            color: theme.colorScheme.onSurface.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildExperience(ThemeData theme, PortfolioViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Work Experience',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 16),
        ...viewModel.experiences.map((experience) => _buildExperienceItem(theme, experience)),
      ],
    );
  }

  Widget _buildExperienceItem(ThemeData theme, JobExperience experience) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.role,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${experience.company} | ${experience.duration}',
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            experience.description,
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.5,
              color: theme.colorScheme.onSurface.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: experience.technologies.map((tech) => Chip(
              label: Text(tech),
              backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
              side: BorderSide(color: theme.colorScheme.primary.withOpacity(0.2)),
            )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildEducation(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Education',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 16),
        _buildEducationItem(
          theme,
          degree: 'Bachelor of Science in Computer Science',
          institution: 'University of Technology',
          duration: '2013 - 2017',
          description: 'Graduated with honors, specializing in mobile application development and algorithms.',
        ),
        const SizedBox(height: 16),
        _buildEducationItem(
          theme,
          degree: 'Flutter Development Certification',
          institution: 'Google Developers',
          duration: '2019',
          description: 'Official certification in Flutter development fundamentals and best practices.',
        ),
      ],
    );
  }

  Widget _buildEducationItem(
    ThemeData theme, {
    required String degree,
    required String institution,
    required String duration,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            degree,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '$institution | $duration',
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.5,
              color: theme.colorScheme.onSurface.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}