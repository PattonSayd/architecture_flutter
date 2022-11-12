part of '../auth_screen.dart';

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<_ViewModel>();

    final buttonState =
        context.select((_ViewModel value) => value.state.buttonState);

    final onPressed =
        buttonState == _ButtonState.enable ? model.onAuthButtonPressed : null;

    final widget = buttonState == _ButtonState.process
        ? const CircularProgressIndicator(
            color: Colors.amber,
          )
        : const Text('Sign In');

    return ElevatedButton(
      onPressed: () => onPressed?.call(context),
      child: widget,
    );
  }
}
