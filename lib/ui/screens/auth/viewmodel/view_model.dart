part of '../auth_screen.dart';

enum _ButtonState {
  disable,
  enable,
  process,
}

class _ViewModelState {
  final String errorCaption;
  final String login;
  final String password;
  final bool progress;

  const _ViewModelState({
    this.errorCaption = '',
    this.login = '',
    this.password = '',
    this.progress = false,
  });

  _ButtonState get buttonState {
    if (progress) {
      return _ButtonState.process;
    } else if (login.isNotEmpty && password.isNotEmpty) {
      return _ButtonState.enable;
    } else {
      return _ButtonState.disable;
    }
  }

  _ViewModelState copyWith({
    String? errorCaption,
    String? login,
    String? password,
    bool? progress,
  }) {
    return _ViewModelState(
      errorCaption: errorCaption ?? this.errorCaption,
      login: login ?? this.login,
      password: password ?? this.password,
      progress: progress ?? this.progress,
    );
  }
}

class _ViewModel extends ChangeNotifier {
  final _authService = AuthService();

  var _state = const _ViewModelState();

  _ViewModelState get state => _state;

  void changeLogin(String value) {
    if (_state.login == value) return;

    _state = _state.copyWith(login: value);
    notifyListeners();
  }

  void changePassword(String value) {
    if (_state.password == value) return;
    _state = _state.copyWith(password: value);
    notifyListeners();
  }

  Future<void> onAuthButtonPressed(BuildContext context) async {
    final login = _state.login;
    final password = _state.password;

    if (login.isEmpty || password.isEmpty) {
      return;
    }

    _state = _state.copyWith(errorCaption: '', progress: true);
    notifyListeners();

    try {
      await _authService.login(login, password).then((value) =>
          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRouteName.home, (route) => false));

      _state = _state.copyWith(progress: false);
      notifyListeners();
    } on AuthApiProviderInCorrectLoginDataError {
      _state = _state.copyWith(
          errorCaption: 'Incorrect Login and Password', progress: false);
      notifyListeners();
    } catch (e) {
      _state = _state.copyWith(errorCaption: 'Error', progress: false);
      notifyListeners();
    }
  }
}
