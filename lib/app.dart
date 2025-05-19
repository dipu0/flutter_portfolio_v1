import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:portfolio/view_models/theme_view_model.dart';
import 'package:portfolio/views/home_view.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeViewModel = Provider.of<ThemeViewModel>(context);
    
    return MaterialApp(
      title: 'Flutter Developer Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0A66C2),
          primary: const Color(0xFF0A66C2),
          secondary: const Color(0xFF26A69A),
          tertiary: const Color(0xFFFF5722),
        ),
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
        useMaterial3: true,
        brightness: themeViewModel.isDarkMode ? Brightness.dark : Brightness.light,
      ),
      home: const HomeView(),
    );
  }
}