import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/modules/business/business.dart';
import 'package:news_app/modules/science/science.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/modules/sports/sports.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStatus>(
      listener:(context,state){} ,
      builder:(context,state){

        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    cubit.changeAppMode();
                  },
                  icon: Icon(Icons.brightness_4_outlined,)),
              IconButton(
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> SearchScreen()));
                  },
                  icon: Icon(Icons.search)),
            ],
          ),
          body: cubit.screen[cubit.cruntindex],

          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.cruntindex,
            onTap: (index)
            {
              NewsCubit.get(context).changeBottomNaveBar(index);
            },
            items:cubit.bottomItems,
          ) ,
        );
      },
    );
  }
}
