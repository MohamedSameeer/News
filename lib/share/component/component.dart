import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget itemList({
  @required Map<String, dynamic> articles,
  @required BuildContext context,
}) {
  return Container(
    padding: EdgeInsets.all(16.0),
    child: Row(
      children: [
        Container(
          width: 120,
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(
                  articles["urlToImage"]!=null?articles["urlToImage"]:"https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png",
                ),
                fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: 16.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                articles["title"],
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                 articles["publishedAt"],
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
