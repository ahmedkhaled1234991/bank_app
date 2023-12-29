import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'modules/main/main_layout.dart';

void main() {
  runApp(const BankApp());
}

class BankApp extends StatelessWidget {
  const BankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 825),
      builder: (_, __) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bank App',
        home: MainLayout(),
      ),
    );
  }
}
