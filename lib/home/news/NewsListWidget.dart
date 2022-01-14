import 'package:flutter/material.dart';
import 'package:news_app/home/data/ApiManager.dart';
import 'package:news_app/home/data/news_response.dart';
import 'package:news_app/home/data/sourses_response.dart';

import 'NewsItemWidget.dart';
//lma ados 3la tab mo3ina alwidget dh ally bt3rd ala5bar bta3tha

class NewsListWidget extends StatefulWidget {
  Sources? source;//news ally mortabta bsource mo3ina
  String? query;//3shan lma a3ml filteration
  NewsListWidget({this.source, this.query}); //{}optional params
  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {

  late ScrollController scrollController;
  int page=1;
  bool shouldloadnextpage=false;
  List<News>news=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController=ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (isTop) {
          print('At the top');
        } else {
         shouldloadnextpage=true;
         setState(() {

         });
        }
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    if(shouldloadnextpage==true){
      ApiManager.loadNews(sources: widget.source?.id,page: ++page).then((newsresponse) {
        print('page is $page');
        if(newsresponse!=null){
          print('news length is ${news.length}');
          setState(() {
            news.addAll(newsresponse.articles!.toList());
            print('news length after add ${news.length}');
            shouldloadnextpage=false;
          });
        }
      });
    }
    return  Expanded(
      child: FutureBuilder<News_response>(
        future: ApiManager.loadNews(sources: widget.source?.id,query:  widget.query),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            //Todo:in case error retry
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            if(news.isEmpty){
              news=snapshot.data!.articles??[];
            }
            //condition bycheck lw a5tat tab tanya
            if(snapshot.data?.articles?.elementAt(0).title!=news[0].title){
             // news.clear();
              scrollController.jumpTo(0);
              news=snapshot.data!.articles??[];
            }
            return ListView.builder(
              controller: scrollController,
              itemBuilder: (buildContext, index) {
                return NewsItemWidget(news[index]);
              },
              itemCount: news.length ?? 0,
            );

          }
          else{
            return Center(child: CircularProgressIndicator());
          }


        },
      ),
    );
  }
}
