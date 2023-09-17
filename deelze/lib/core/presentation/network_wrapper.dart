import 'package:deelze/features/auth/auth_wrapper.dart';
import 'package:flutter/material.dart';

class NetworkWrapper extends StatelessWidget {
  const NetworkWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AuthWrapper(),
    );
  }
}
