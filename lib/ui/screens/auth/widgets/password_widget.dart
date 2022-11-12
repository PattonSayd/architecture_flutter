part of '../auth_screen.dart';

class _PasswordWidget extends StatelessWidget {
  const _PasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<_ViewModel>();
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
      onChanged: model.changePassword,
    );
  }
}
