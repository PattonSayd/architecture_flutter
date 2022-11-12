import 'package:flutter/material.dart';
import 'package:mvvm_counter/domain/entity/user.dart';
import 'package:mvvm_counter/domain/services/auth_service.dart';
import 'package:provider/provider.dart';

part 'viewmodel/view_model.dart';

class LoaderScreen extends StatelessWidget {
  const LoaderScreen({super.key});

  static Widget assembly() => Provider(
        create: (context) => _ViewModel(context),
        lazy: false,
        child: const LoaderScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
