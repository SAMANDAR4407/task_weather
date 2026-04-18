import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:task_weather/features/bloc/home/home_bloc.dart';
import 'package:task_weather/core/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          final location = data?.location;
          final current = data?.current;

          if (state.status == EnumStatus.loading) {
            return Center(child: CircularProgressIndicator.adaptive());
          }
          if (state.status == EnumStatus.fail) {
            return Center(child: Text('Something went wrong :('));
          }
          if (state.status == EnumStatus.initial) {
            return Center(child: Text('Welcome!'));
          }
          return Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Text(
                  style: Theme.of(context).textTheme.headlineLarge,
                  '${location?.name}\n${location?.region}',
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: CachedNetworkImage(imageUrl: 'http:${current?.condition?.icon.toString()}', fit: BoxFit.cover),
                    ),
                    Text('Temperature\n${current?.tempC}℃', style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Wind speed\n${current?.windMph} m/h', style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
                    Text('Humidity\n${current?.humidity}%', style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
