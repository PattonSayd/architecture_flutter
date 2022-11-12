part of '../auth_screen.dart';

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final error =
        context.select((_ViewModel value) => value.state.errorCaption);
    return Text(error);
  }
}
