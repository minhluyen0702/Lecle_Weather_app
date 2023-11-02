import 'package:flutter/material.dart';

Widget getWeatherImage(int code) {
  switch (code) {
    case >= 200 && < 300:
      return Image.asset('assets/weather/1.png');
    case >= 300 && < 400:
      return Image.asset('assets/weather/2.png');
    case >= 500 && < 600:
      return Image.asset('assets/weather/3.png');
    case >= 600 && < 700:
      return Image.asset('assets/weather/4.png');
    case >= 700 && < 800:
      return Image.asset('assets/weather/5.png');
    case 800:
      return Image.asset('assets/weather/6.png');
    case 801:
      return Image.asset('assets/weather/7.png');
    case 802:
      return Image.asset('assets/weather/8.png');
    default:
      return Image.asset('assets/weather/9.png');
  }
}

Widget getWish(int time) {
  switch (time) {
    case >= 5 && < 11:
      return const Text(
        'GOOD MORNING!',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    case >= 11 && < 16:
      return const Text(
        'GOOD AFTERNOON!',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    case >= 16 && < 21:
      return const Text(
        'GOOD EVENING!',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    default:
      return const Text(
        'GOOD NIGHT!',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
  }
}

Decoration getColorBottom(int time) {
  switch (time) {
    case >= 5 && < 11:
      return const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.yellow,
      );
    case >= 11 && < 16:
      return const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.amber,
      );
    case >= 16 && < 21:
      return const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green,
      );
    default:
      return const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.deepPurple,
      );
  }
}

Decoration getColorTop(int time) {
  switch (time) {
    case >= 5 && < 11:
      return const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.yellow,
      );
    case >= 11 && < 16:
      return const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.amber,
      );
    case >= 16 && < 21:
      return const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.green,
      );
    default:
      return const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.deepPurple,
      );
  }
}