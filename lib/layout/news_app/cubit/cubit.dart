import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/modules/business/business.dart';
import 'package:news_app/modules/science/science.dart';
import 'package:news_app/modules/sports/sports.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStatus>
{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int cruntindex= 0;
  List<BottomNavigationBarItem> bottomItems =
  [
    BottomNavigationBarItem(
        icon: Icon(
            Icons.business),
        label: 'Business'

    ),
    BottomNavigationBarItem(
        icon: Icon(
            Icons.sports),
        label: 'Sports'

    ),
    BottomNavigationBarItem(
        icon: Icon(
            Icons.science),
        label: 'science'

    ),
  ];

  List<Widget> screen=
  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen()
  ];
  void changeBottomNaveBar(int index)
  {
    cruntindex= index;
    emit(NewsBootomNavState());
  }

  List<dynamic> business=[];
  void getBusiness()
  {

    emit(NewsBusinessLodingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'f47f55b570fd4498b5d02e3e5599377e'
        }

    ).then((value) {
      //print(value.data['articles'][0]['title']);
      business=value.data['articles'];
      print(business[0]['title']);

      emit(NewsBusinessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports=[];
  void getSports()
  {

    emit(NewsSportsLodingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sports',
          'apiKey':'f47f55b570fd4498b5d02e3e5599377e'
        }

    ).then((value) {
      //print(value.data['articles'][0]['title']);
      sports=value.data['articles'];
      print(sports[0]['title']);

      emit(NewsSportsState());
    }).catchError((error){
      print(error.toString());
      emit(NewsSportsErrorState(error.toString()));
    });
  }

  List<dynamic> science=[];
  void getScience()
  {

    emit(NewsScienceLodingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apiKey':'f47f55b570fd4498b5d02e3e5599377e'
        }

    ).then((value) {
      //print(value.data['articles'][0]['title']);
      science=value.data['articles'];
      print(science[0]['title']);

      emit(NewsScienceState());
    }).catchError((error){
      print(error.toString());
      emit(NewsScienceErrorState(error.toString()));
    });
  }

  bool isDark =false;
  void changeAppMode({bool? fromShared})
  {
    if(fromShared != null)
    {
      isDark = fromShared;
      emit(NewsModeState());
    }
    else
    isDark = !isDark;
    CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
      emit(NewsModeState());
    });

  }

  List<dynamic> search=[];
  void getSearch(String value)
  {

    emit(NewsSearchLodingState());

    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q':'$value',
          'apiKey':'f47f55b570fd4498b5d02e3e5599377e'
        }

    ).then((value) {
      //print(value.data['articles'][0]['title']);
      search=value.data['articles'];
      print(search[0]['title']);
      emit(NewsSearchState());
    }).catchError((error){
      print(error.toString());
      emit(NewsSearchErrorState(error.toString()));
    });
  }


}

