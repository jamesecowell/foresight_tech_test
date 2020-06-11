import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foresight_tech_test/blocs/home/home.dart';

import 'package:foresight_tech_test/screens/widgets/app_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List data = [];
  String query = r'''
  query Rallies {
    rallies {
      round
      name
      rallyStatus
    }
  }
''';

  @override
  void initState() {
    super.initState();
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('WRC 2020'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStates>(
      builder: (BuildContext context, HomeStates state) {
        if (state is Loading) {
          return Scaffold(
            appBar: _buildAppBar(),
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is LoadDataFail) {
          return Scaffold(
            appBar: _buildAppBar(),
            body: Center(child: Text(state.error)),
          );
        } else {
          data = (state as LoadDataSuccess).data['rallies'];
          return Scaffold(
            appBar: _buildAppBar(),
            body: _buildBody(),
          );
        }
      },
    );
  }

  Widget _buildBody() {
    return RefreshIndicator(
        child: Container(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              var item = data[index];
              return Card(
                elevation: 4.0,
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  // leading: Text(item['round']),
                  title: Text(item['name']),
                  trailing: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: item['rallyStatus'] == 'cancelled'
                          ? Colors.red.withOpacity(0.3)
                          : item['rallyStatus'] == 'postponed'
                              ? Colors.amber.withOpacity(0.3)
                              : item['rallyStatus'] == 'complete'
                                  ? Colors.blue.withOpacity(0.3)
                                  : Colors.green.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    child: Text(
                      item['rallyStatus'],
                      style: TextStyle(
                        color: item['rallyStatus'] == 'cancelled'
                            ? Colors.red
                            : item['rallyStatus'] == 'postponed'
                                ? Colors.amber
                                : item['rallyStatus'] == 'complete'
                                    ? Colors.blue
                                    : Colors.green,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        onRefresh: () {
          BlocProvider.of<HomeBloc>(context).add(RefreshHomeData(query));
        });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
