import 'package:flutter/material.dart';
import 'package:module_21_assignment/widgets/logo_widget.dart';

class TeamColumn extends StatelessWidget {
  final String? logoUrl;
  final String name;
  final double fontSize;

  const TeamColumn(
      {super.key,
      required this.logoUrl,
      required this.name,
      this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (logoUrl != null)
          SizedBox(
            width: 40,
            height: 40,
            child: LogoWidget(logoUrl: logoUrl!),
          )
        else
          const Icon(Icons.sports_soccer, size: 40, color: Colors.white),
        const SizedBox(height: 10),
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
