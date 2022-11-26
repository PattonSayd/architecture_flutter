import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/blocs/users_bloc.dart';

const verticalSpace = SizedBox(height: 8);

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              _AgeTitleWidget(),
              verticalSpace,
              _AgeIncrementWidget(),
              verticalSpace,
              _AgeDecrementWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AgeTitleWidget extends StatelessWidget {
  const _AgeTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UsersBloc>();
    return StreamBuilder<UsersState>(
      initialData: bloc.state,
      stream: bloc.stream,
      builder: (context, snapshot) {
        final age = snapshot.requireData.currentUser.age;
        return Text("$age");
      },
    );
  }
}

class _AgeIncrementWidget extends StatelessWidget {
  const _AgeIncrementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UsersBloc>();
    return ElevatedButton(
      onPressed: () => bloc.dispatch(UsersIncrementEvent()),
      child: const Text('+'),
    );
  }
}

class _AgeDecrementWidget extends StatelessWidget {
  const _AgeDecrementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UsersBloc>();
    return ElevatedButton(
      onPressed: () => bloc.dispatch(UsersDecrementEvent()),
      child: const Text('-'),
    );
  }
}
