import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:portfolio/config/config.dart';
import 'package:portfolio/widgets/section_title.dart';
import 'package:portfolio/widgets/skill_progress.dart';

class TechStackView extends StatelessWidget {
  const TechStackView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final isMobile = sizingInformation.deviceScreenType == DeviceScreenType.mobile;
        final padding = isMobile ? 24.0 : 48.0;
        
        return Container(
          padding: EdgeInsets.all(padding),
          color: theme.colorScheme.primary.withOpacity(0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: 'Tech Stack'),
              
              const SizedBox(height: 16),
              
              Text(
                'Technologies and tools I work with',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              
              const SizedBox(height: 32),
              
              isMobile
                  ? _buildMobileLayout(theme)
                  : _buildDesktopLayout(theme),
              
              const SizedBox(height: 40),
              
              _buildTools(theme, isMobile),
            ],
          ),
        );
      },
    );
  }
  
  Widget _buildMobileLayout(ThemeData theme) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: AppConfig.skills.length,
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemBuilder: (context, index) {
        final skill = AppConfig.skills[index];
        return SkillProgress(
          name: skill['name'],
          level: skill['level'],
        );
      },
    );
  }
  
  Widget _buildDesktopLayout(ThemeData theme) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 32,
        mainAxisSpacing: 32,
        childAspectRatio: 4,
      ),
      itemCount: AppConfig.skills.length,
      itemBuilder: (context, index) {
        final skill = AppConfig.skills[index];
        return SkillProgress(
          name: skill['name'],
          level: skill['level'],
        );
      },
    );
  }
  
  Widget _buildTools(ThemeData theme, bool isMobile) {
    final tools = [
      'Android Studio',
      'VS Code',
      'Git',
      'GitHub Actions',
      'Figma',
      'Firebase',
      'AWS',
      'Docker',
    ];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Development Tools',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: tools.map((tool) => Chip(
            label: Text(tool),
            backgroundColor: theme.colorScheme.surface,
            side: BorderSide(color: theme.colorScheme.primary),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            labelStyle: TextStyle(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          )).toList(),
        ),
      ],
    );
  }
}