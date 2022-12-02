import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedatabase/moviescreen.dart';

import 'blocs/movieinfo/movieinfo_bloc.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  // var images = [
  //   "https://www.washingtonpost.com/graphics/2019/entertainment/oscar-nominees-movie-poster-design/img/black-panther-web.jpg",
  //   "https://cdn.pastemagazine.com/www/system/images/photo_albums/best-movie-posters-2016/large/moonlight-ver2-xlg.jpg",
  //   "https://www.digitalartsonline.co.uk/cmsdata/slideshow/3662115/baby-driver-rory-hi-res.jpg",
  //   "https://i.pinimg.com/736x/99/f8/70/99f8702093bd74454c4636a33f558c4a.jpg",
  //   "https://cdn.shopify.com/s/files/1/0969/9128/products/TheHouseOfGucci-AdamDriverLadyGaGa-HollywoodMoviePoster_large.jpg",
  //   "https://imgc.allpostersimages.com/img/posters/dc-comics-movie-the-batman-one-sheet_u-L-FA850Z0.jpg",
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 48, 48, 48),
      appBar: AppBar(
        title: Center(
          child: Text(
            "iBomma",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: BlocBuilder<MovieinfoBloc, MovieinfoState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Where Quality and Quantity matters",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                state is MovieinfoInitial
                    ? SizedBox()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<MovieinfoBloc>()
                                  .add(PreviousPageEvent());
                            },
                            child: Text("Previous"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<MovieinfoBloc>()
                                  .add(NextPageEvent());
                            },
                            child: Text("Next"),
                          ),
                        ],
                      ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Watch and download Telugu movies in excellent quality at the smallest file size. Exclusively designed & developed for smartphones, tablets and PCs.",
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                state is MovieinfoInitial
                    ? SizedBox()
                    : Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 350,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 30),
                          itemCount: state.movies.results!.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MovieScreen(
                                          currentIndex: index,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/w500${state.movies.results![index].posterPath}",
                                    height: 140,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  state.movies.results![index].title.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  state.movies.results![index].voteAverage
                                      .toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            );
                          },
                        ),
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}
