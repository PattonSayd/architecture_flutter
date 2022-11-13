import 'package:flutter/material.dart';
import 'package:mvvm_simple/ui/screens/counter/counter_screen.dart';
import 'package:provider/provider.dart';

import '../../domain/blocs/users_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider<UsersCubit>(
        create: (_) => UsersCubit(),
        dispose: (_, value) => value.close(),
        child: const CounterScreen(),
      ),
    );
  }
}
