import 'package:flutter/material.dart';

class MediaImageWidget extends StatelessWidget {
  final String posterPath;

  const MediaImageWidget({super.key, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage('https://image.tmdb.org/t/p/w500/$posterPath'),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
          child: CircularProgressIndicator(
            color: Colors.white,
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      height: 170,
      width: 120,
    );
  }
}
