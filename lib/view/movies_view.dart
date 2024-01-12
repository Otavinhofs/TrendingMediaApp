import 'package:flutter/material.dart';
import 'package:teste/controller/movies_controller.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final MoviesController _controller = MoviesController();

  @override
  void initState() {
    super.initState();
    _controller.fetchData(
      'https://api.themoviedb.org/3/discover/movie?language=pt-BR&sort_by=popularity.desc',
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movies',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
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

Widget screenSuccess(MoviesController store, Size size) {
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

Widget moviesView(MoviesController store, index, Size size) {
  final item = store.state.value[index];

  return Card(
    color: Colors.blue.shade300,
    semanticContainer: true,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Image(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500/${item.posterPath}'),
                height: 170,
                width: 120,
              ),
              const SizedBox(
                width: 25,
              ),
              Center(
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
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          item.releasDate,
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
                        const SizedBox(
                          width: 5,
                        ),
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
                        const SizedBox(
                          width: 5,
                        ),
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
              )
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
          Text(
            item.overview,
            style: const TextStyle(
              decorationThickness: BorderSide.strokeAlignInside,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    ),
  );
}
