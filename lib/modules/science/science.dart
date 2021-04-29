import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/share/component/component.dart';
import 'package:news/share/cubit/news_cubit.dart';
import 'package:news/share/cubit/news_states.dart';

class Science extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewsCubit cubit = NewsCubit.getInstance(context);
    cubit.getScienceData();
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list=cubit.science;
        return state is! LoadingState
            ? itemList(articles: list,context: context)
            : Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
