import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/business/business.dart';
import 'package:news/modules/science/science.dart';
import 'package:news/modules/settings/settings.dart';
import 'package:news/modules/sports/sports.dart';
import 'package:news/share/cubit/news_states.dart';
import 'file:///E:/AndroidProject/flutter/news/lib/share/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{

  NewsCubit() : super(InitialState());
  static NewsCubit getInstance(context)=>BlocProvider.of(context);

  //Change Screens
  int currentIndex=0;
  List<String> screenNames=["Business", "Sports", "Science"];
  List<Widget> screens=[Business(),Sports(),Science()];

  void changeScreen(int index){
    currentIndex=index;
    emit(ScreenChangeState());
  }

  
  //Get data from api
  List business=[];
  List sports=[];
  List science=[];
  void getBusinessData(){
    if(business.length==0){
      emit(LoadingState());
      DioHelper.getDate(
          path: "/v2/top-headlines",
          query:{
            "category":"business",
            "country":"eg",
            "apiKey":"803c950feec64958b66674fcaeeff457",
          }
      ).then((value) {
        business=value.data['articles'];
        emit(GetBusinessDataState());
      }).catchError((onError){
        print("error in business get data:  ${onError.toString()}");
        emit(OnErrorState());
      }
      );
    }else{
      emit(GetBusinessDataState());
    }
  }
  void getScienceData(){
    if(science.length==0){
      emit(LoadingState());
      DioHelper.getDate(
          path: "/v2/top-headlines",
          query:{
            "category":"science",
            "country":"eg",
            "apiKey":"803c950feec64958b66674fcaeeff457",
          }
      ).then((value) {
        science=value.data['articles'];
        emit(GetBusinessDataState());
      }).catchError((onError){
        print("error in Science get data:  ${onError.toString()}");
        emit(OnErrorState());
      }
      );
    }else{
      emit(GetScienceDataState());
    }
  }
  void getSportData(){
    if(sports.length==0){
      emit(LoadingState());
      DioHelper.getDate(
          path: "/v2/top-headlines",
          query:{
            "category":"sport",
            "country":"eg",
            "apiKey":"803c950feec64958b66674fcaeeff457",
          }
      ).then((value) {
        sports=value.data['articles'];
        emit(GetSportDataState());
      }).catchError((onError){
        print("error in business get data:  ${onError.toString()}");
        emit(OnErrorState());
      }
      );
    }else{
      emit(GetSportDataState());
    }
  }

  // Change Theme

  bool isDark=false;
  void changeDarkMode(){
    isDark= !isDark;
    emit(ChangeThemeState());
  }
}