import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

import '../../movieinfo.dart';

part 'movieinfo_event.dart';
part 'movieinfo_state.dart';

class MovieinfoBloc extends Bloc<MovieinfoEvent, MovieinfoState> {
  MovieinfoBloc()
      : super(MovieinfoInitial(movies: MoviesModel(), pagenumber: 1)) {
    on<GetMoviesInfo>((event, emit) async {
      Response res = await get(Uri.parse(
          "https://api.themoviedb.org/3/movie/popular?page=${state.pagenumber}&api_key=656e9330225cea8f0f9546183c25259f"));
      if (res.statusCode == 200) {
        var convertedData = MoviesModel.fromJson(jsonDecode(res.body));
        emit(MovieinfoState(
            movies: convertedData, pagenumber: state.pagenumber));
      }
    });
    on<NextPageEvent>((event, emit) async {
      int pagenumber = state.pagenumber + 1;
      Response res = await get(Uri.parse(
          "https://api.themoviedb.org/3/movie/popular?page=$pagenumber&api_key=656e9330225cea8f0f9546183c25259f"));
      if (res.statusCode == 200) {
        var convertedData = MoviesModel.fromJson(jsonDecode(res.body));
        emit(MovieinfoState(movies: convertedData, pagenumber: pagenumber));
      }
    });
    on<PreviousPageEvent>((event, emit) async {
      if (state.pagenumber > 1) {
        int pagenumber = state.pagenumber - 1;
        Response res = await get(Uri.parse(
            "https://api.themoviedb.org/3/movie/popular?page=$pagenumber&api_key=656e9330225cea8f0f9546183c25259f"));
        if (res.statusCode == 200) {
          var convertedData = MoviesModel.fromJson(jsonDecode(res.body));
          emit(MovieinfoState(movies: convertedData, pagenumber: pagenumber));
        }
      }
    });
    on<NextMovieEvent>((event, emit) async {
      if (event.index < 19) {
        int curindex = event.index + 1;
        emit(ChangeMovieState(
            movieindex: curindex,
            movies: state.movies,
            pagenumber: state.pagenumber));
      }
    });
    on<PreviousMovieEvent>((event, emit) async {
      if (event.index > 0) {
        int curindex = event.index - 1;
        emit(ChangeMovieState(
            movieindex: curindex,
            movies: state.movies,
            pagenumber: state.pagenumber));
      }
    });
  }
}
