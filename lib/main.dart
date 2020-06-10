import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foresight_tech_test/blocs/home/home.dart';
import 'package:foresight_tech_test/blocs/simple_delegate.dart';
import 'package:foresight_tech_test/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

String query = r'''
  query Rallies {
    rallies {
      round
      name
    }
  }
''';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WRC 2020',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc()..add(FetchHomeData(query)),
        child: HomeScreen(),
      ),
    );
  }
}
