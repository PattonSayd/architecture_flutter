part of '../home_screen.dart';

class _ViewModel extends ChangeNotifier {
  Future<void> logout(BuildContext context) async {
    final authService = AuthService();

    await authService.logout().then((_) => Navigate.toLoader(context));
  }
}
