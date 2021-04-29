import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/modules/web_view/web_view.dart';

Widget itemList({
  @required List articles,
  @required BuildContext context,
}) {
  return ListView.separated(
    itemBuilder: (BuildContext context, int index) => InkWell(
      onTap:() {navigateTO(context, WebViewScreen(articles[index]['url']));},
      child: Container(
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
                      articles[index]["urlToImage"] != null
                          ? articles[index]["urlToImage"]
                          : "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png",
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    articles[index]["title"],
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    articles[index]["publishedAt"],
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    separatorBuilder: (BuildContext context, int index) => Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey[300],
    ),
    itemCount: articles.length,
  );
}

navigateTO(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));
