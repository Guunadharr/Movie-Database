import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedatabase/home.dart';

import 'blocs/movieinfo/movieinfo_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieinfoBloc()..add(GetMoviesInfo()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 0, 30, 54),
            iconTheme: IconThemeData(color: Colors.green),
            titleTextStyle: TextStyle(color: Colors.white),
          ),
        ),
        home: Home(),
      ),
    );
  }
}
