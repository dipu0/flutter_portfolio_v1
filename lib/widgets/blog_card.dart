import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/models/blog_post.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogCard extends StatelessWidget {
  final BlogPost post;
  
  const BlogCard({
    super.key,
    required this.post,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Format date
    final DateTime publishDate = DateTime.tryParse(post.publishDate) ?? DateTime.now();
    final String formattedDate = DateFormat('MMM d, yyyy').format(publishDate);
    
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () async {
          final url = Uri.parse(post.link);
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                post.title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              
              const SizedBox(height: 8),
              
              // Publish Date
              Text(
                formattedDate,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Excerpt
              Text(
                post.excerpt,
                style: theme.textTheme.bodyMedium?.copyWith(
                  height: 1.5,
                  color: theme.colorScheme.onSurface.withOpacity(0.8),
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              
              const SizedBox(height: 16),
              
              TextButton.icon(
                onPressed: () async {
                  final url = Uri.parse(post.link);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Read More'),
                style: TextButton.styleFrom(
                  foregroundColor: theme.colorScheme.primary,
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}