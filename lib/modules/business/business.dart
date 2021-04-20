import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/share/component/component.dart';
import 'package:news/share/cubit/news_cubit.dart';
import 'package:news/share/cubit/news_states.dart';

class Business extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewsCubit cubit = NewsCubit.getInstance(context);
    cubit.getBusinessData();
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list=cubit.business;
        return state is! LoadingState
            ? ListView.separated(
                itemBuilder: (context, index) => itemList(context: context,articles: list[index]),
                separatorBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
                itemCount: cubit.business.length)
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
