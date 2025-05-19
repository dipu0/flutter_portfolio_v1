import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:portfolio/view_models/blog_view_model.dart';
import 'package:portfolio/widgets/section_title.dart';
import 'package:portfolio/widgets/blog_card.dart';
import 'package:portfolio/config/config.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogView extends StatelessWidget {
  const BlogView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final blogViewModel = Provider.of<BlogViewModel>(context);
    
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
              const SectionTitle(title: 'Blog'),
              
              const SizedBox(height: 16),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Recent articles from Medium',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () async {
                      final url = Uri.parse('https://medium.com/@${AppConfig.mediumUsername}');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    icon: const Icon(Icons.open_in_new),
                    label: const Text('View All'),
                    style: TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 32),
              
              _buildBlogContent(context, blogViewModel, isMobile),
            ],
          ),
        );
      },
    );
  }
  
  Widget _buildBlogContent(BuildContext context, BlogViewModel viewModel, bool isMobile) {
    if (viewModel.isLoading) {
      return Center(
        child: Column(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(
              'Loading blog posts...',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      );
    }
    
    if (viewModel.error != null) {
      return Center(
        child: Column(
          children: [
            Icon(
              Icons.error_outline,
              color: Theme.of(context).colorScheme.error,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              'Failed to load blog posts',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              viewModel.error!,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: viewModel.retry,
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
            ),
          ],
        ),
      );
    }
    
    if (viewModel.posts.isEmpty) {
      return Center(
        child: Column(
          children: [
            Icon(
              Icons.article_outlined,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              'No blog posts found',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      );
    }
    
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: viewModel.posts.length > 3 ? 3 : viewModel.posts.length,
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemBuilder: (context, index) {
        final post = viewModel.posts[index];
        return BlogCard(post: post);
      },
    );
  }
}