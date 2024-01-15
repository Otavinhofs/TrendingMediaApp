import 'package:flutter/material.dart';
import 'package:teste/model/movies_model.dart';
import 'package:teste/settings.dart';

class MediaDetailsWidget extends StatelessWidget {
  final MoviesModel item;
  final Size size;

  const MediaDetailsWidget({required this.item, required this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width * 0.5,
            child: Text(
              item.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.date_range_rounded,
                color: Colors.red,
              ),
              const SizedBox(width: 5),
              Text(
                item.type == Type.movie ? "Filme" : "Serie",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.star_border,
                color: Colors.yellow,
              ),
              const SizedBox(width: 5),
              Text(
                '${item.voteAverage}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.date_range_rounded,
                color: Colors.green,
              ),
              const SizedBox(width: 5),
              Text(
                '${item.voteCount}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
