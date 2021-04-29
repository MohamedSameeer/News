import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/search/search.dart';
import 'package:news/share/component/component.dart';
import 'package:news/share/cubit/news_cubit.dart';
import 'package:news/share/cubit/news_states.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context, state){} ,
      builder: (context, state){
        NewsCubit cubit=NewsCubit.getInstance(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.screenNames[cubit.currentIndex],
            ),
            actions: [
              IconButton(icon: Icon(Icons.search), onPressed: (){
                  navigateTO(context, Search());
              }),
              IconButton(icon:Icon(Icons.brightness_2), onPressed: (){
                NewsCubit.getInstance(context).changeDarkMode();
              }),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (value){
              cubit.changeScreen(value);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: "Business",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_soccer),
                label: "Sports",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.science_outlined),
                label: "Science",
              ),
            ],
          ),
        );
      },
    );
  }
}
