import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:portfolio/config/config.dart';
import 'package:portfolio/widgets/section_title.dart';
import 'package:portfolio/widgets/service_card.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final isMobile = sizingInformation.deviceScreenType == DeviceScreenType.mobile;
        final isTablet = sizingInformation.deviceScreenType == DeviceScreenType.tablet;
        final padding = isMobile ? 24.0 : 48.0;
        
        // Determine number of grid columns based on screen size
        int crossAxisCount = 1;
        if (isTablet) crossAxisCount = 2;
        if (!isMobile && !isTablet) crossAxisCount = 3;
        
        return Container(
          padding: EdgeInsets.all(padding),
          color: theme.colorScheme.surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: 'Services'),
              
              const SizedBox(height: 16),
              
              Text(
                'What I can do for you',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 32),
              
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: isMobile ? 1.0 : 1.2,
                ),
                itemCount: AppConfig.services.length,
                itemBuilder: (context, index) {
                  final service = AppConfig.services[index];
                  return ServiceCard(
                    title: service['title']!,
                    description: service['description']!,
                    icon: service['icon']!,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}