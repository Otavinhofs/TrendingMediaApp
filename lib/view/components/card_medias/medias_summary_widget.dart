import 'package:flutter/material.dart';

class MovieSummaryWidget extends StatelessWidget {
  final String overview;

  const MovieSummaryWidget({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return Text(
      overview,
      style: const TextStyle(
        decorationThickness: BorderSide.strokeAlignInside,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    );
  }
}
