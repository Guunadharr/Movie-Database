// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movieinfo_bloc.dart';

class MovieinfoState extends Equatable {
  final MoviesModel movies;
  final int pagenumber;
  const MovieinfoState({
    required this.movies,
    required this.pagenumber,
  });

  @override
  List<Object> get props => [movies, pagenumber];
}

class MovieinfoInitial extends MovieinfoState {
  MovieinfoInitial({required super.movies, required super.pagenumber});
}

class ChangeMovieState extends MovieinfoState {
  final int movieindex;
  const ChangeMovieState(
      {required this.movieindex,
      required super.movies,
      required super.pagenumber});

  @override
  List<Object> get props => [movieindex];
}

// class MoviesInfoLoading extends MovieinfoState {}

// class MoviesInfoLoaded extends MovieinfoState {
//   final MoviesModel movies;
//   final int pagenumber;
//   const MoviesInfoLoaded({
//     required this.movies,
//     required this.pagenumber,
//   });

//   @override
//   List<Object> get props => [movies, pagenumber];
// }
