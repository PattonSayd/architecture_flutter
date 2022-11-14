import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_simple/domain/blocs/blocs_observer.dart';
import 'package:mvvm_simple/ui/screens/app.dart';

void main() {
  const app = MyApp();
  Bloc.observer = OwnBlocObserver();
  runApp(app);
}
