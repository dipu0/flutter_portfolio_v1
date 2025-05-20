import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class NavigationViewModel extends ChangeNotifier {
  final ItemScrollController scrollController = ItemScrollController();
  final ItemPositionsListener positionsListener =
      ItemPositionsListener.create();
  int _currentSection = 0;

  int get currentSection => _currentSection;

  set currentSection(int value) {
    if (_currentSection != value) {
      _currentSection = value;
      notifyListeners();
    }
  }

  void scrollTo(int index) {
    scrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void disposeControllers() {
    // scrollController.itemScrollController?.dispose();
    positionsListener.itemPositions.removeListener(_onScroll);
  }

  void _onScroll() {
    final positions = positionsListener.itemPositions.value;

    if (positions.isNotEmpty) {
      final visibleItems = positions
          .where((item) => item.itemLeadingEdge <= 1 && item.itemTrailingEdge >= 0)
          .toList();

      if (visibleItems.isNotEmpty) {
        visibleItems.sort((a, b) {
          final aCenter = (a.itemLeadingEdge + a.itemTrailingEdge) / 2;
          final bCenter = (b.itemLeadingEdge + b.itemTrailingEdge) / 2;
          return (aCenter - 0.5).abs().compareTo((bCenter - 0.5).abs());
        });

        final mostCentered = visibleItems.first.index;
        currentSection = mostCentered;
      }
    }
  }


  void initialize() {
    positionsListener.itemPositions.addListener(_onScroll);
  }
}
