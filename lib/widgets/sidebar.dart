import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/view_models/theme_view_model.dart';

class Sidebar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const Sidebar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeViewModel = Provider.of<ThemeViewModel>(context);
    
    return Container(
      width: 250,
      color: theme.colorScheme.surface,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: theme.colorScheme.primary, width: 2),
                    image: const DecorationImage(
                      image: NetworkImage('https://via.placeholder.com/100x100'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'MD. ASAD CHOWDHURY DIPU',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Flutter Developer',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildNavItem(
                  context,
                  icon: Icons.home_outlined,
                  title: 'Home',
                  index: 0,
                ),
                _buildNavItem(
                  context,
                  icon: Icons.person_outline,
                  title: 'About',
                  index: 1,
                ),
                _buildNavItem(
                  context,
                  icon: Icons.work_outline,
                  title: 'Portfolio',
                  index: 2,
                ),
                _buildNavItem(
                  context,
                  icon: Icons.design_services_outlined,
                  title: 'Services',
                  index: 3,
                ),
                _buildNavItem(
                  context,
                  icon: Icons.code,
                  title: 'Tech Stack',
                  index: 4,
                ),
                _buildNavItem(
                  context,
                  icon: Icons.article_outlined,
                  title: 'Blog',
                  index: 5,
                ),
                _buildNavItem(
                  context,
                  icon: Icons.mail_outline,
                  title: 'Contact',
                  index: 6,
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => themeViewModel.toggleTheme(),
                  icon: Icon(
                    themeViewModel.isDarkMode
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined,
                  ),
                  tooltip: themeViewModel.isDarkMode ? 'Light Mode' : 'Dark Mode',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required int index,
  }) {
    final theme = Theme.of(context);
    final isSelected = currentIndex == index;
    
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? theme.colorScheme.primary : null,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? theme.colorScheme.primary : null,
        ),
      ),
      selected: isSelected,
      selectedTileColor: theme.colorScheme.primary.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      onTap: () => onTap(index),
    );
  }
}