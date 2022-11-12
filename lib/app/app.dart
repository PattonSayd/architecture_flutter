import 'package:flutter/material.dart';
import 'package:mvvm_counter/app/router/app_router.dart';
import 'package:mvvm_counter/ui/screens/loader/loader_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: AppRoute.routes,
      onGenerateRoute: AppRoute.onGenerateRoute,
      home: LoaderScreen.assembly(),
    );
  }
}
