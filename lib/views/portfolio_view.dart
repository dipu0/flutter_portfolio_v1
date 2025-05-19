import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:portfolio/view_models/portfolio_view_model.dart';
import 'package:portfolio/widgets/section_title.dart';
import 'package:portfolio/widgets/project_card.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final portfolioViewModel = Provider.of<PortfolioViewModel>(context);
    
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final isMobile = sizingInformation.deviceScreenType == DeviceScreenType.mobile;
        final isTablet = sizingInformation.deviceScreenType == DeviceScreenType.tablet;
        final padding = isMobile ? 24.0 : 48.0;
        
        // Determine number of grid columns based on screen size
        int crossAxisCount = 1;
        if (!isMobile && !isTablet) crossAxisCount = 2;
        
        return Container(
          padding: EdgeInsets.all(padding),
          color: theme.colorScheme.primary.withOpacity(0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: 'Portfolio'),
              
              const SizedBox(height: 16),
              
              Text(
                'Explore my recent projects',
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
                  childAspectRatio: isMobile ? 0.7 : 0.8,
                ),
                itemCount: portfolioViewModel.projects.length,
                itemBuilder: (context, index) {
                  final project = portfolioViewModel.projects[index];
                  return ProjectCard(project: project);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}