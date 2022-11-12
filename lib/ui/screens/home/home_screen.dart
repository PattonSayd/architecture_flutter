// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mvvm_counter/domain/services/auth_service.dart';
import 'package:mvvm_counter/ui/navigation/navigate.dart';

part 'viewmodel/view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static Widget assembly() => ChangeNotifierProvider(
        create: (_) => _ViewModel(),
        child: const HomeScreen(),
      );

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<_ViewModel>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton.icon(
            onPressed: () => viewModel.logout(context),
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
          ),
        ],
      ),
      body: const Center(child: MyWidget()),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final model = User();
  late String? name = '';
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          name = 'fuad $count';
          count++;

          var modelNew = model.copyWith(name: name);
          print(modelNew.name);
        },
        child: Text('data'),
      ),
    );
  }
}

class User {
  final String? name;

  User({
    this.name,
  });

  User copyWith({
    String? name,
  }) {
    return User(
      name: name ?? this.name,
    );
  }
}
