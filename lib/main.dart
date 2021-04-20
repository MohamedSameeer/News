import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/layout/home_layout.dart';
import 'package:news/share/component/state_observer.dart';
import 'package:news/share/cubit/news_cubit.dart';
import 'package:news/share/cubit/news_states.dart';
import 'file:///E:/AndroidProject/flutter/news/lib/share/network/remote/dio_helper.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DioHelper.init();
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: TextTheme(
              bodyText1: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            appBarTheme: AppBarTheme(
              titleSpacing: 20.0,
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark),
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            scaffoldBackgroundColor: Colors.white,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0),
          ),
          darkTheme: ThemeData(
            textTheme: TextTheme(
              bodyText1: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            appBarTheme: AppBarTheme(
              titleSpacing: 20.0,
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor("333739"),
                  statusBarIconBrightness: Brightness.light),
              backgroundColor: HexColor("333739"),
            ),
            scaffoldBackgroundColor: HexColor("333739"),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrange,
              unselectedItemColor: Colors.grey,
              elevation: 20.0,
              backgroundColor: HexColor("333739"),
            ),
          ),
          themeMode: NewsCubit.getInstance(context).isDark?ThemeMode.dark:ThemeMode.light,
          home: Home(),
        ),
      ),
    );
  }
}
