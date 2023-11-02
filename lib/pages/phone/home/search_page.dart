import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../blocs/weather/weather_bloc.dart';
import 'components/getTheme.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String tempUnit = 'C';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CupertinoSearchTextField(
          placeholder: 'Search more location on the world...',
          backgroundColor: Colors.grey.shade50,
          onSubmitted: (text) {
            if (text.isEmpty) {
              return null;
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) =>
                        WeatherBloc()..add(FetchCityName(text)),
                    child: SearchPage(),
                  ),
                ),
              );
            }
          },
        ),

      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(-2.5, -0.3),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(2.5, -0.3),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, -1.2),
                  child: Container(
                    height: 400,
                    width: 600,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 100, sigmaX: 100),
                  child: Container(),
                ),
                BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherSuccess) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Center(
                              child: Text(
                                'YOU ARE HERE!: ${state.weather.areaName!.toUpperCase()} - ${state.weather.country}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                           /* Center(
                              child: Text(
                                'latitude: ${state.weather.latitude} - longitude: ${state.weather.longitude}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),*/
                            Center(
                              child: getWeatherImage(
                                  state.weather.weatherConditionCode!),
                            ),
                            Center(
                              child: Text(
                                tempUnit == 'C'
                                    ? '${state.weather.temperature!.celsius!.round()}°C'
                                    : '${state.weather.temperature!.fahrenheit!.round()}°F',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 80,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                '${state.weather.weatherMain!.toUpperCase()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Center(
                              child: Text(
                                DateFormat('EEEE, MMM dd -')
                                    .add_jm()
                                    .format(state.weather.date!),
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/weather/11.png',
                                      scale: 6,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Sunrise',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 22,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          DateFormat()
                                              .add_jm()
                                              .format(state.weather.sunrise!),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/weather/12.png',
                                      scale: 6,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Sunset',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 22,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          DateFormat()
                                              .add_jm()
                                              .format(state.weather.sunset!),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/weather/13.png',
                                      scale: 6,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Temp.Max',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 22,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          tempUnit == 'C'
                                              ? '${state.weather.tempMax!.celsius!.round()}°C'
                                              : '${state.weather.tempMax!.fahrenheit!.round()}°F',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/weather/14.png',
                                      scale: 6,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Temp.Min',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 22,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          tempUnit == 'C'
                                              ? '${state.weather.tempMin!.celsius!.round()}°C'
                                              : '${state.weather.tempMin!.fahrenheit!.round()}°F',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: tempUnit == 'C'
            ? Text(
          '°F',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )
            : Text(
          '°C',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        onPressed: () {
          setState(() {
            tempUnit == 'C' ? tempUnit = 'F' : tempUnit = 'C';
          });
        },
      ),
    );
  }
}
