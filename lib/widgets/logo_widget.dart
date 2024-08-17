import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final String logoUrl;

  const LogoWidget({super.key, required this.logoUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      logoUrl,
      fit: BoxFit.contain,
      height: 60,
      width: 60,
      errorBuilder: (
          context, error, stackTrace) => const Icon(
          Icons.error, color: Colors.red, size: 60),
    );
  }
}
