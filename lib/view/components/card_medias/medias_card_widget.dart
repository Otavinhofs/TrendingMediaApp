import 'package:flutter/material.dart';
import 'package:teste/controller/movies_controller.dart';
import 'package:teste/view/components/card_medias/medias_details_widget.dart';
import 'package:teste/view/components/card_medias/medias_image_widget.dart';
import 'package:teste/view/components/card_medias/medias_summary_widget.dart';

class MoviesView extends StatelessWidget {
  final SeriesController store;
  final int index;
  final Size size;

  const MoviesView(
      {super.key,
      required this.store,
      required this.index,
      required this.size});

  @override
  Widget build(BuildContext context) {
    final item = store.state.value[index];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      color: Colors.blue.shade300,
      semanticContainer: true,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                MediaImageWidget(posterPath: item.posterPath),
                const SizedBox(
                  width: 25,
                ),
                MediaDetailsWidget(item: item, size: size)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 2,
              color: Colors.black,
            ),
            MovieSummaryWidget(
              overview: item.overview,
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
