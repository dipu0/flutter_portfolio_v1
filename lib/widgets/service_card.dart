import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final String icon;
  
  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _getIconData(icon),
                color: theme.colorScheme.primary,
                size: 32,
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Title
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 8),
            
            // Description
            Text(
              description,
              style: theme.textTheme.bodyMedium?.copyWith(
                height: 1.5,
                color: theme.colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'mobile':
        return Icons.phone_android;
      case 'globe':
        return Icons.language;
      case 'layout':
        return Icons.dashboard;
      case 'database':
        return Icons.storage;
      case 'briefcase':
        return Icons.business_center;
      default:
        return Icons.devices;
    }
  }
}