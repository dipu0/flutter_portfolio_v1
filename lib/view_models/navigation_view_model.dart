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
      final firstVisible = positions.first;
      final lastVisible = positions.last;
      final center = (firstVisible.index + lastVisible.index) ~/ 2;
      currentSection = center;
    }
  }

  void initialize() {
    positionsListener.itemPositions.addListener(_onScroll);
  }
}
