import 'package:flutter/material.dart';

class HomeStateProvider extends ChangeNotifier {
  int _selectedTeamIndex = 0;
  int _currentIndex = 0;

  int get selectedTeamIndex => _selectedTeamIndex;
  int get currentIndex => _currentIndex;

  void setSelectedTeamIndex(int index) {
    _selectedTeamIndex = index;
    notifyListeners();
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
