import 'package:flutter/material.dart';
import 'package:teste/controller/movies_controller.dart';
import 'package:teste/view/components/card_medias/medias_details_widget.dart';
import 'package:teste/view/components/card_medias/medias_image_widget.dart';
import 'package:teste/view/components/card_medias/medias_summary_widget.dart';

class SeriesScreen extends StatefulWidget {
  const SeriesScreen({super.key});

  @override
  State<SeriesScreen> createState() => _SeriesScreenState();
}

class _SeriesScreenState extends State<SeriesScreen> {
  final SeriesController _controller = SeriesController();

  @override
  void initState() {
    super.initState();
    _controller.fetchData(
      'https://api.themoviedb.org/3/discover/tv?language=pt-BR&sort_by=popularity.desc',
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movies',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        width: size.width,
        child: AnimatedBuilder(
          animation: Listenable.merge(
            [_controller.isLoading, _controller.state],
          ),
          builder: (context, child) {
            if (_controller.isLoading.value == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (_controller.state.value.isEmpty) {
              return stateIsEmpty();
            } else {
              return screenSuccess(_controller, size);
            }
          },
        ),
      ),
    );
  }

  Widget stateIsEmpty() {
    return const Center(
      child: Text(
        'nenhum item a lista',
        style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget screenSuccess(SeriesController store, Size size) {
    return SizedBox(
      width: size.width,
      child: ListView.separated(
        itemBuilder: (_, index) {
          return moviesView(store, index, size);
        },
        separatorBuilder: (content, index) => const SizedBox(
          height: 30,
        ),
        itemCount: store.state.value.length,
      ),
    );
  }

  Widget moviesView(store, index, Size size) {
    Size size = MediaQuery.of(context).size;
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
            const SizedBox(
              height: 10,
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
