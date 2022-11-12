import 'package:flutter/material.dart';
import 'package:mvvm_simple/ui/screens/counter/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

import 'counter/counter_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => ViewModel(),
        child: const CounterScreen(),
      ),
    );
  }
}
