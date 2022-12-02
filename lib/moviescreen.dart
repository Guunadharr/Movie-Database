import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/movieinfo/movieinfo_bloc.dart';
import 'movieinfo.dart';

class MovieScreen extends StatelessWidget {
  // final Page page;
  int currentIndex;
  MovieScreen({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieinfoBloc, MovieinfoState>(
      builder: (context, state) {
        if (state is ChangeMovieState) {
          currentIndex = state.movieindex;
        }
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 48, 48, 48),
          appBar: AppBar(
            title: Text(state.movies.results![currentIndex].title.toString()),
          ),
          body: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 130,
                        width: 130,
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500${state.movies.results![currentIndex].posterPath}",
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Text(
                                  state.movies.results![currentIndex].title
                                      .toString(),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "[${state.movies.results![currentIndex].releaseDate}]",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Row(
                              children: [
                                Text(
                                  state
                                      .movies.results![currentIndex].voteAverage
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "[${state.movies.results![currentIndex].voteCount}]",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Language: ${state.movies.results![currentIndex].originalLanguage}",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    state.movies.results![currentIndex].overview.toString(),
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<MovieinfoBloc, MovieinfoState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<MovieinfoBloc>()
                                  .add(PreviousMovieEvent(index: currentIndex));
                            },
                            child: Text("Previous"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<MovieinfoBloc>()
                                  .add(NextMovieEvent(index: currentIndex));
                            },
                            child: Text("Next"),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
