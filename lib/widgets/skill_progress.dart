import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkillProgress extends StatelessWidget {
  final String name;
  final double level;
  
  const SkillProgress({
    super.key,
    required this.name,
    required this.level,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final percentage = (level * 100).round();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '$percentage%',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Container(
                  width: constraints.maxWidth,
                  height: 10,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Animate(
                  effects: [
                    SlideEffect(
                      begin: const Offset(-1, 0),
                      end: const Offset(0, 0),
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeOutQuad,
                    ),
                  ],
                  child: Container(
                    width: constraints.maxWidth * level,
                    height: 10,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.primary.withOpacity(0.7),
                          theme.colorScheme.primary,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ],
    );
  }
}