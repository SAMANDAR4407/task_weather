import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_weather/core/core.dart';
import 'package:task_weather/features/bloc/cities/cities_bloc.dart';
import 'package:task_weather/presentation/widgets/widget.dart';

class CitiesScreen extends StatelessWidget {
  const CitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text('Cities')),
      body: Column(
        mainAxisSize: .max,
        children: [
          SizedBox(
            height: 80,
            child: ListView.separated(
              scrollDirection: .horizontal,
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.read<CitiesBloc>().add(FetchData(query: cities[index]));
                  },
                  child: CityItem(name: cities[index]),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 20);
              },
              itemCount: cities.length,
            ),
          ),
          BlocBuilder<CitiesBloc, CitiesState>(
            builder: (context, state) {
              final data = state.data;

              switch (state.status) {
                case .initial:
                  return Expanded(
                    child: Center(child: ConditionInfo(text: 'Select the city!', size: 20)),
                  );
                case .loading:
                  return Expanded(child: Center(child: CircularProgressIndicator.adaptive()));
                case .fail:
                  return Expanded(
                    child: Center(
                      child: ConditionInfo(text: 'Something went wrong :(\nCheck internet connection', size: 20),
                    ),
                  );
                default:
              }
              return Expanded(child: WeatherInfo(data: data!));
            },
          ),
        ],
      ),
    );
  }
}
