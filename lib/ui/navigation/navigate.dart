import 'package:flutter/material.dart';

import '../../app/router/app_router.dart';

class Navigate {
  Navigate._();

  static void toLoader(BuildContext context) => Navigator.of(context)
      .pushNamedAndRemoveUntil(AppRouteName.loader, (route) => false);
}
