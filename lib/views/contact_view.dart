import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:portfolio/config/config.dart';
import 'package:portfolio/widgets/section_title.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });
      
      // This is a mock submission - in a real app, you would send to a backend
      await Future.delayed(const Duration(seconds: 2));
      
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Message sent successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();
      }
    }
  }

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
              const SectionTitle(title: 'Contact Me'),
              
              const SizedBox(height: 16),
              
              Text(
                'Get in touch for collaborations, consultations, or just to say hi!',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              
              const SizedBox(height: 32),
              
              isMobile
                  ? _buildMobileLayout(theme)
                  : _buildDesktopLayout(theme),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileLayout(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactForm(theme),
        const SizedBox(height: 32),
        _buildContactInfo(theme),
      ],
    );
  }

  Widget _buildDesktopLayout(ThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: _buildContactForm(theme),
        ),
        const SizedBox(width: 48),
        Expanded(
          flex: 2,
          child: _buildContactInfo(theme),
        ),
      ],
    );
  }

  Widget _buildContactForm(ThemeData theme) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              hintText: 'Enter your name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: const Icon(Icons.person_outline),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: const Icon(Icons.email_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _messageController,
            decoration: InputDecoration(
              labelText: 'Message',
              hintText: 'Enter your message',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: const Icon(Icons.message_outlined),
              alignLabelWithHint: true,
            ),
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              if (value.length < 10) {
                return 'Message must be at least 10 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: _isSubmitting ? null : _submitForm,
              icon: _isSubmitting
                  ? Container(
                      width: 24,
                      height: 24,
                      padding: const EdgeInsets.all(2.0),
                      child: const CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                    )
                  : const Icon(Icons.send),
              label: Text(_isSubmitting ? 'Sending...' : 'Send Message'),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Information',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 24),
        _buildContactInfoItem(
          theme,
          icon: Icons.email_outlined,
          title: 'Email',
          content: 'contact@example.com',
          onTap: () async {
            final url = Uri.parse('mailto:contact@example.com');
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
          },
        ),
        const SizedBox(height: 16),
        _buildContactInfoItem(
          theme,
          icon: Icons.location_on_outlined,
          title: 'Location',
          content: 'San Francisco, CA',
          onTap: null,
        ),
        const SizedBox(height: 32),
        Text(
          'Social Links',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: AppConfig.socialLinks.entries.map((entry) {
            IconData icon;
            switch (entry.key) {
              case 'github':
                icon = Icons.code;
                break;
              case 'linkedin':
                icon = Icons.link;
                break;
              case 'twitter':
                icon = Icons.chat_bubble_outline;
                break;
              case 'medium':
                icon = Icons.bookmark_border;
                break;
              default:
                icon = Icons.link;
            }
            
            return InkWell(
              onTap: () async {
                final url = Uri.parse(entry.value);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              borderRadius: BorderRadius.circular(48),
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 32),
        OutlinedButton.icon(
          onPressed: () async {
            final url = Uri.parse('https://calendly.com/macdipu');
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
          },
          icon: const Icon(Icons.calendar_today),
          label: const Text('Schedule a Meeting'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            side: BorderSide(color: theme.colorScheme.primary),
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfoItem(
    ThemeData theme, {
    required IconData icon,
    required String title,
    required String content,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    content,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: onTap != null ? theme.colorScheme.primary : null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}