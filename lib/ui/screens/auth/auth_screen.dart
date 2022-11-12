import 'package:flutter/material.dart';
import 'package:mvvm_counter/app/router/app_router.dart';
import 'package:mvvm_counter/domain/data_providers(%D1%85%D1%80%D0%B0%D0%BD%D0%B8%D0%BB%D0%B8%D1%89%D0%B5)/auth_api_provider.dart';
import 'package:mvvm_counter/domain/services/auth_service.dart';
import 'package:provider/provider.dart';

part 'viewmodel/view_model.dart';
part 'widgets/login_widget.dart';
part 'widgets/password_widget.dart';
part 'widgets/error_widget.dart';
part 'widgets/auth_button_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  static Widget assembly() => ChangeNotifierProvider(
        create: (_) => _ViewModel(),
        child: const AuthScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              _ErrorWidget(),
              _LoginWidget(),
              SizedBox(height: 12),
              _PasswordWidget(),
              SizedBox(height: 12),
              _AuthButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
