import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/view_models/theme_view_model.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;
  final Function(int) onTap;
  
  const MobileAppBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  
  @override
  Size get preferredSize => const Size.fromHeight(56);
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeViewModel = Provider.of<ThemeViewModel>(context);
    final titles = ['Home', 'About', 'Portfolio', 'Services', 'Tech Stack', 'Blog', 'Contact'];
    
    return AppBar(
      title: Text(
        titles[currentIndex],
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.primary,
        ),
      ),
      centerTitle: true,
      actions: [
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
    );
  }
}