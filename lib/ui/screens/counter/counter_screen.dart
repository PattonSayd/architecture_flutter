import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/blocs/users_bloc.dart';

const verticalSpace = SizedBox(height: 8);

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocListener<UsersBloc, UsersState>(
      // BlocListener срабатывает на изменения стейта без перерисовки виджетов, like didChangeDependency
      listener: (context, state) {
        print(state.currentUser.age);
      },
      child: Scaffold(
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
      ),
    );
  }
}

class _AgeTitleWidget extends StatelessWidget {
  const _AgeTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // первый вариант(Provider) использования
    // final age = context.select((UsersBloc bloc) => bloc.state.currentUser.age);
    // return Text("$age");

    // второй ваpиатн(BlocProvider) использования
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        final age = state.currentUser.age;
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
      onPressed: () => bloc.add(UsersIncrementEvent()),
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
      onPressed: () => bloc.add(UsersDecrementEvent()),
      child: const Text('-'),
    );
  }
}
