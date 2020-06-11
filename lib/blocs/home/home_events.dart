import 'package:equatable/equatable.dart';
import 'package:foresight_tech_test/blocs/home/home.dart';

abstract class HomeEvents extends Equatable {
  HomeEvents();

  @override
  List<Object> get props => null;
}

class FetchHomeData extends HomeEvents {
  final String query;
  final Map<String, dynamic> variables;

  FetchHomeData(this.query, {this.variables}) : super();

  @override
  List<Object> get props => [query, variables];
}

class RefreshHomeData extends HomeEvents {
  final String query;
  final Map<String, dynamic> variables;

  RefreshHomeData(this.query, {this.variables}) : super();

  @override
  List<Object> get props => [query, variables];
}
