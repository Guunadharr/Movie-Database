// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movieinfo_bloc.dart';

abstract class MovieinfoEvent extends Equatable {
  const MovieinfoEvent();

  @override
  List<Object> get props => [];
}

class GetMoviesInfo extends MovieinfoEvent {}

class NextPageEvent extends MovieinfoEvent {}

class PreviousPageEvent extends MovieinfoEvent {}

class NextMovieEvent extends MovieinfoEvent {
  final int index;
  const NextMovieEvent({
    required this.index,
  });
}

class PreviousMovieEvent extends MovieinfoEvent {
  final int index;
  const PreviousMovieEvent({
    required this.index,
  });
}
