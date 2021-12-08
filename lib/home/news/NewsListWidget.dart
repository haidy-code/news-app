import 'package:flutter/material.dart';
import 'package:news_app/home/data/ApiManager.dart';
import 'package:news_app/home/data/news_response.dart';
import 'package:news_app/home/data/sports_response.dart';

import 'NewsItemWidget.dart';

class NewsListWidget extends StatelessWidget {
  Sources? source;//news ally mortabta bsource mo3ina
  String? query;//3shan lma a3ml filteration

  NewsListWidget({this.source, this.query});//{}optional params

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: FutureBuilder<News_response>(
        future: ApiManager.loadNews(source?.id, query),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            //Todo:in case error retry
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemBuilder: (buildContext, index) {
              return NewsItemWidget(snapshot.data!.articles!.elementAt(index));
            },
            itemCount: snapshot.data?.articles?.length ?? 0,
          );
        },
      ),
    );
  }
}
