import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/view_models/blog_view_model.dart';
import 'package:portfolio/view_models/portfolio_view_model.dart';
import 'package:portfolio/view_models/theme_view_model.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeViewModel()),
        ChangeNotifierProvider(create: (_) => PortfolioViewModel()),
        ChangeNotifierProvider(create: (_) => BlogViewModel()),
      ],
      child: const PortfolioApp(),
    ),
  );
}