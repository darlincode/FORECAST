import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/models/models.dart';
import 'package:fancy_weather/screens/home_screen/home_screen_view_model.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

@immutable
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoadingTest;

  void onInit(Store<GlobalAppState> store) {
    _isLoadingTest = store.state.loadingStatus == LoadingStatus.Loading;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalAppState, HomeScreenViewModel>(
      distinct: true,
      converter: (Store<GlobalAppState> store) =>
          HomeScreenViewModel.create(store),
      onInit: onInit,
      builder: (context, viewModel) {
        _isLoadingTest = viewModel.isLoading;
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(_isLoadingTest ? Icons.toggle_off : Icons.toggle_on),
                onPressed: () {
                  if (_isLoadingTest) {
                    viewModel.dispatch(
                      SetLoadingStatusAction(LoadingStatus.Idle),
                    );
                  } else {
                    viewModel.dispatch(
                      SetLoadingStatusAction(LoadingStatus.Loading),
                    );
                  }
                },
              )
            ],
          ),
          key: _scaffoldKey,
          body: viewModel.isLoading
              ? Center(
                  child: CircularProgressIndicator(color: AppTheme.green),
                )
              : Center(
                  child: Text(
                    'Home Screen',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 32,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
