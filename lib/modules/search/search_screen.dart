import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStatus>(
      listener: (context ,state){},
      builder: (context , state)
      {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black12
                  ),
                  validator: ( value)
                  {
                    if( value!.isEmpty)
                    {
                      return 'Search Must not br Empty';
                    }else
                    {
                      return null;
                    }
                  },
                  onChanged: (value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  },
                  decoration: InputDecoration(
                    enabled: true,
                    labelText: 'Search',

                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),

                ),
              ),
              Expanded(child: BlocConsumer<NewsCubit,NewsStatus>(
                listener:(context, state){} ,
                builder:(context, state){
                  var list = NewsCubit.get(context).search;

                  return  list.length >0 ? ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context,index)=>buildArticalItem(list[index],context),
                      separatorBuilder: (context,index)=>Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey[300],
                        ),
                      ),
                      itemCount: list.length):Center(child: CircularProgressIndicator());
                },
              ),),
            ],
          ),
        );
      },
    );
  }
}


