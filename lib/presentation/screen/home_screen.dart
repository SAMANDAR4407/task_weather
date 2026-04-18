import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:task_weather/core/utils/utils.dart';
import 'package:task_weather/features/bloc/home/home_bloc.dart';
import 'package:task_weather/presentation/screen/screen.dart';

import '../widgets/widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Position? _currentPosition;

  @override
  void initState() {
    getCurrentPosition((position) {
      setState(() {
        _currentPosition = position;
      });
    }).then((a) {
      fetch();
    });
    super.initState();
  }

  void fetch() {
    context.read<HomeBloc>().add(
      FetchData(query: _currentPosition == null ? null : '${_currentPosition?.latitude},${_currentPosition?.longitude}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final data = state.data;

          switch (state.status) {
            case .initial:
              return Center(child: ConditionInfo(text: 'Welcome!', size: 20));
            case .loading:
              return Center(child: CircularProgressIndicator.adaptive());
            case .fail:
              return Center(child: ConditionInfo(text: 'Something went wrong :(\nCheck internet connection', size: 20));
            default:
          }
          return WeatherInfo(data: data!);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) => CitiesScreen()));
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
