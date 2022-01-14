import 'package:flutter/material.dart';
import 'package:news_app/home/data/news_response.dart';
import 'package:news_app/home/news/NewsDetails.dart';

class NewsItemWidget extends StatelessWidget {
  News news;

  NewsItemWidget(this.news);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(NewsDetails.routename,arguments: news);
      },
      child: Container(
        margin: EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //cliprrect 3shan a3ml al image bcurve
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                news.urlToImage ?? "",
                fit: BoxFit.cover,
                height: 200, //adat height w 3amlt cover 3shan maifdalsh yload swar fe wa2t twel
              ),
              // CachedNetworkImage(
              //   imageUrl: "http://via.placeholder.com/200x150",
              //   placeholder: (context, url) => Center(
              //     child: CircularProgressIndicator(
              //
              //     ),
              //   ),
              //   errorWidget: (context, url, error) => Icon(Icons.error),
              //   fit:BoxFit.cover,
              //   height: 200,
              //
              // ),
            ),
            Text(news.source?.name ?? ""),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                news.title ?? "",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
            Text(
              news.publishedAt ?? "",
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
