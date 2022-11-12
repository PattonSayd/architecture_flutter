import 'package:flutter/material.dart';

import '../../../../domain/services/user_service.dart';

class ViewModelState {
  final String ageTitle;
  ViewModelState({
    required this.ageTitle,
  });
}

class ViewModel extends ChangeNotifier {
  final _userService = UserService();

  var _state = ViewModelState(ageTitle: '');
  ViewModelState get state => _state;

  void loadValue() async {
    await _userService.initilalize();
    _updateState();
  }

  ViewModel() {
    loadValue();
  }

  Future<void> onIncrementButtonPressed() async {
    _userService.incrementAge();
    _updateState();
  }

  Future<void> onDecrementButtonPressed() async {
    _userService.decrementAge();
    _updateState();
  }

  void _updateState() {
    final user = _userService.user;

    _state = ViewModelState(
      ageTitle: user.age.toString(),
    );
    notifyListeners();
  }
}
