import 'package:flutter/material.dart';
import 'package:portfolio/views/home_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:portfolio/config/config.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroView extends StatelessWidget {
  const HeroView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final isMobile = sizingInformation.deviceScreenType == DeviceScreenType.mobile;
        final boxPadding = isMobile ? 24.0 : 48.0;
        
        return Container(
          height: sizingInformation.screenSize.height * 0.9,
          padding: EdgeInsets.symmetric(horizontal: boxPadding, vertical: boxPadding),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                theme.colorScheme.primary.withOpacity(0.1),
                theme.colorScheme.surface,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image - Circular avatar or placeholder
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: theme.colorScheme.primary, width: 4),
                  image: const DecorationImage(
                    image: NetworkImage('https://via.placeholder.com/150x150'),
                    fit: BoxFit.cover,
                  ),
                ),
              ).animate().slideX(begin: -30, end: 0, duration: 600.ms).fadeIn(duration: 800.ms),
              
              const SizedBox(height: 32),
              
              // Name
              Text(
                AppConfig.name,
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onBackground,
                ),
              ).animate().slideX(begin: -30, end: 0, duration: 600.ms, delay: 200.ms).fadeIn(duration: 800.ms, delay: 200.ms),
              
              const SizedBox(height: 8),
              
              // Tagline
              Text(
                AppConfig.tagline,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ).animate().slideX(begin: -30, end: 0, duration: 600.ms, delay: 300.ms).fadeIn(duration: 800.ms, delay: 300.ms),
              
              const SizedBox(height: 24),
              
              // Short Bio
              Text(
                AppConfig.shortBio,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.8),
                ),
              ).animate().slideX(begin: -30, end: 0, duration: 600.ms, delay: 400.ms).fadeIn(duration: 800.ms, delay: 400.ms),
              
              const SizedBox(height: 40),
              
              // Action Buttons
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Scroll to portfolio section
                      Scrollable.ensureVisible(
                        HomeView.sectionKeys[2].currentContext!,
                        duration: const Duration(milliseconds: 500),
                      );
                    },
                    icon: const Icon(Icons.work_outline),
                    label: const Text('View My Work'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                    ),
                  ).animate().slideX(begin: -30, end: 0, duration: 600.ms, delay: 500.ms).fadeIn(duration: 800.ms, delay: 500.ms),
                  
                  const SizedBox(width: 16),
                  
                  OutlinedButton.icon(
                    onPressed: () {
                      // Scroll to contact section
                      Scrollable.ensureVisible(
                        HomeView.sectionKeys[6].currentContext!,
                        duration: const Duration(milliseconds: 500),
                      );
                    },
                    icon: const Icon(Icons.mail_outline),
                    label: const Text('Contact Me'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      side: BorderSide(color: theme.colorScheme.primary),
                      foregroundColor: theme.colorScheme.primary,
                    ),
                  ).animate().slideX(begin: -30, end: 0, duration: 600.ms, delay: 600.ms).fadeIn(duration: 800.ms, delay: 600.ms),
                ],
              ),
              
              const SizedBox(height: 40),
              
              // Social Links
              Row(
                children: _buildSocialLinks(theme),
              ).animate().slideX(begin: -30, end: 0, duration: 600.ms, delay: 700.ms).fadeIn(duration: 800.ms, delay: 700.ms),
            ],
          ),
        );
      },
    );
  }
  
  List<Widget> _buildSocialLinks(ThemeData theme) {
    final Map<String, IconData> socialIcons = {
      'github': Icons.code,
      'linkedin': Icons.link,
      'twitter': Icons.chat_bubble_outline,
      'medium': Icons.bookmark_border,
    };
    
    return AppConfig.socialLinks.entries.map((entry) {
      return Padding(
        padding: const EdgeInsets.only(right: 16),
        child: IconButton(
          onPressed: () async {
            final url = Uri.parse(entry.value);
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
          },
          icon: Icon(socialIcons[entry.key] ?? Icons.link),
          color: theme.colorScheme.primary,
          tooltip: entry.key.capitalizeFirst(),
          iconSize: 28,
        ),
      );
    }).toList();
  }
}

extension StringExtension on String {
  String capitalizeFirst() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}