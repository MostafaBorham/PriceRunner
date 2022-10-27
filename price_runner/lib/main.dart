import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_runner/cubit/price_runner_cubit.dart';
import 'pages/price_runner_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
          title: 'Price Runner',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF54328E))),
              textTheme: const TextTheme(
                      titleMedium: TextStyle(fontWeight: FontWeight.w600),
                      titleSmall: TextStyle(fontWeight: FontWeight.w600),
                      labelSmall: TextStyle(),
                      bodySmall: TextStyle(),
                      bodyMedium: TextStyle(),
                      titleLarge: TextStyle(fontWeight: FontWeight.w600),
                      labelMedium: TextStyle(fontWeight: FontWeight.w400))
                  .apply(
                bodyColor: const Color(0xFF54328E),
                displayColor: const Color(0xFF54328E),
              )),
          home: BlocProvider<PriceRunnerCubit>(
              create: (BuildContext context) =>PriceRunnerCubit()..getProductInfo(),
          child: const PriceRunnerScreen()));
  }
}