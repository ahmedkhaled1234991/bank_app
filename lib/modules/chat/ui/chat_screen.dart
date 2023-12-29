import 'package:flutter/material.dart';

import '../../../core/theming/app_styles.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Chat Screen',
          style: AppStyles.styleSemiBold16,
        ),
      ),
    );
  }
}
