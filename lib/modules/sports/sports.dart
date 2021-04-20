import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/share/component/component.dart';
import 'package:news/share/cubit/news_cubit.dart';
import 'package:news/share/cubit/news_states.dart';

class Sports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewsCubit cubit = NewsCubit.getInstance(context);
    cubit.getSportData();
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list=cubit.sports;
        if (state is! LoadingState) {
          return ListView.separated(
            itemBuilder: (context, index) => itemList(context: context,articles: list[index]),
            separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
            itemCount: cubit.business.length);
        } else {
          return Center(
          child: CircularProgressIndicator(),
        );
        }
      },
    );
  }
}
