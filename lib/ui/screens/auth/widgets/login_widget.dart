part of '../auth_screen.dart';

class _LoginWidget extends StatelessWidget {
  const _LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<_ViewModel>();
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Login',
        border: OutlineInputBorder(),
      ),
      onChanged: model.changeLogin,
    );
  }
}
