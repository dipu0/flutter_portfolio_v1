import 'package:flutter/material.dart';
import 'package:portfolio/config/config.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeView extends StatelessWidget {
  const ResumeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      color: theme.colorScheme.primary,
      child: Column(
        children: [
          Text(
            'Want to view my resume?',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onPrimary,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () async {
              final url = Uri.parse(AppConfig.resumeUrl);
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            icon: const Icon(Icons.download),
            label: const Text('Download Resume'),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.onPrimary,
              foregroundColor: theme.colorScheme.primary,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            '© ${DateTime.now().year} ${AppConfig.name}. All rights reserved.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onPrimary.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}