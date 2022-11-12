class AuthApiProviderInCorrectLoginDataError {}

class AuthApiProvider {
  Future<String> login(String login, String password) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    final isSuccess = login == 'admin' && password == '123456';
    if (isSuccess) {
      return 'fg4re324rfe2ji3nj4r';
    } else {
      throw AuthApiProviderInCorrectLoginDataError();
    }
  }
}
