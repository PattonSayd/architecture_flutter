part of '../loader_screen.dart';

class _ViewModel {
  final _authService = AuthService();
  BuildContext context;

  _ViewModel(this.context) {
    initial();
  }

  void initial() async {
    final isAuth = await _authService.checkAuth();
    if (isAuth) {
      _navigateToAppScreen();
    } else {
      _navigateToAuthScreen();
    }
  }

  void _navigateToAppScreen() {
    Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);
  }

  void _navigateToAuthScreen() {
    Navigator.of(context).pushNamedAndRemoveUntil('auth', (route) => false);
  }
}
