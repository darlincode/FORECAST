import 'package:fancy_weather/screens/home_screen/home_screen_view_model.dart';
import 'package:fancy_weather/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalAppState, HomeScreenViewModel>(
      distinct: true,
      converter: (Store<GlobalAppState> store) =>
          HomeScreenViewModel.create(store),
      builder: (context, viewModel) {
        return Scaffold(
          key: _scaffoldKey,
          body: viewModel.isLoading
              ? CircularProgressIndicator()
              : Center(
                  child: Text('Home Screen'),
                ),
        );
      },
    );
  }
}
