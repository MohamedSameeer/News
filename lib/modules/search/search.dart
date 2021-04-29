import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/share/component/component.dart';
import 'package:news/share/cubit/news_cubit.dart';
import 'package:news/share/cubit/news_states.dart';

class Search extends StatelessWidget {
  TextEditingController searchController;

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state)=>Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Search",
                    prefixIcon: Icon(Icons.search),
                  ),
                  maxLines: 1,
                  onChanged: (value) {
                    print(value);
                    NewsCubit.getInstance(context).getSearchData(value);
                  },
                ),
              ),
              Expanded(child: itemList(articles: NewsCubit.getInstance(context).search, context: context))

            ],
          )
      ),

    );
  }
}
