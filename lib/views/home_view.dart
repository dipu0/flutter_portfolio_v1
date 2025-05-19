import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:portfolio/views/hero_view.dart';
import 'package:portfolio/views/about_view.dart';
import 'package:portfolio/views/portfolio_view.dart';
import 'package:portfolio/views/services_view.dart';
import 'package:portfolio/views/tech_stack_view.dart';
import 'package:portfolio/views/blog_view.dart';
import 'package:portfolio/views/contact_view.dart';
import 'package:portfolio/views/resume_view.dart';
import 'package:portfolio/widgets/sidebar.dart';
import 'package:portfolio/widgets/mobile_app_bar.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static final List<GlobalKey> sectionKeys = List.generate(7, (index) => GlobalKey());

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();
  int _currentSection = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final scrollPosition = _scrollController.position.pixels;
    for (int i = HomeView.sectionKeys.length - 1; i >= 0; i--) {
      final GlobalKey key = HomeView.sectionKeys[i];
      final RenderObject? renderObject = key.currentContext?.findRenderObject();
      if (renderObject != null && renderObject is RenderBox) {
        final RenderBox box = renderObject;
        final position = box.localToGlobal(Offset.zero).dy;
        if (position <= 100) {
          if (_currentSection != i) {
            setState(() {
              _currentSection = i;
            });
          }
          break;
        }
      }
    }
  }

  void scrollToSection(int index) {
    final GlobalKey key = HomeView.sectionKeys[index];
    final RenderObject? renderObject = key.currentContext?.findRenderObject();
    if (renderObject != null && renderObject is RenderBox) {
      final RenderBox box = renderObject;
      final position = box.localToGlobal(Offset.zero).dy;
      final scrollPosition = _scrollController.position.pixels + position - 80;
      _scrollController.animateTo(
        scrollPosition,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final isMobile = sizingInformation.deviceScreenType == DeviceScreenType.mobile;

        return Scaffold(
          appBar: isMobile ? MobileAppBar(currentIndex: _currentSection, onTap: scrollToSection) : null,
          drawer: isMobile
              ? Sidebar(
            currentIndex: _currentSection,
            onTap: (index) {
              Navigator.pop(context);
              scrollToSection(index);
            },
          )
              : null,
          body: Row(
            children: [
              if (!isMobile)
                Sidebar(
                  currentIndex: _currentSection,
                  onTap: scrollToSection,
                ),
              Expanded(
                child: ListView(
                  controller: _scrollController,
                  padding: EdgeInsets.zero,
                  children: [
                    HeroView(key: HomeView.sectionKeys[0]),
                    AboutView(key: HomeView.sectionKeys[1]),
                    PortfolioView(key: HomeView.sectionKeys[2]),
                    ServicesView(key: HomeView.sectionKeys[3]),
                    TechStackView(key: HomeView.sectionKeys[4]),
                    BlogView(key: HomeView.sectionKeys[5]),
                    Column(
                      children: [
                        ContactView(key: HomeView.sectionKeys[6]),
                        const ResumeView(),
                      ],
                    ),
                  ].animate(interval: 100.ms).fadeIn(duration: 600.ms),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
