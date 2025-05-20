import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/view_models/navigation_view_model.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../widgets/mobile_app_bar.dart';
import '../widgets/sidebar.dart';
import 'about_view.dart';
import 'blog_view.dart';
import 'contact_view.dart';
import 'hero_view.dart';
import 'portfolio_view.dart';
import 'resume_view.dart';
import 'services_view.dart';
import 'tech_stack_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> _sections = [
    const HeroView(),
    const AboutView(),
    const PortfolioView(),
    const ServicesView(),
    const TechStackView(),
    const BlogView(),
    const ContactView(),
    const ResumeView(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NavigationViewModel>(context, listen: false).initialize();
    });
  }

  @override
  void dispose() {
    Provider.of<NavigationViewModel>(context, listen: false)
        .disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final isMobile =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile;
        final scrollProvider = Provider.of<NavigationViewModel>(context);

        return Scaffold(
          appBar: isMobile
              ? MobileAppBar(
                  currentIndex: scrollProvider.currentSection,
                  onTap: scrollProvider.scrollTo,
                )
              : null,
          drawer: isMobile
              ? Sidebar(
                  currentIndex: scrollProvider.currentSection,
                  onTap: (index) {
                    Navigator.pop(context);
                    scrollProvider.scrollTo(index);
                  },
                )
              : null,
          body: Row(
            children: [
              if (!isMobile)
                Sidebar(
                  currentIndex: scrollProvider.currentSection,
                  onTap: scrollProvider.scrollTo,
                ),
              Expanded(
                child: ScrollablePositionedList.builder(
                  itemScrollController: scrollProvider.scrollController,
                  itemPositionsListener: scrollProvider.positionsListener,
                  itemCount: _sections.length,
                  itemBuilder: (context, index) => _sections[index]
                      .animate(delay: (100 * index).ms)
                      .fadeIn(duration: 600.ms),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
