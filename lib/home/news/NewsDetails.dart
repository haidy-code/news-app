import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/home/data/news_response.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
static const String routename='NewsDetails';


  @override
  Widget build(BuildContext context) {
    var news=ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(
        title: Text(news.source?.name??''),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30)
            )
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
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
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Text(
              news.publishedAt ?? "",
              textAlign: TextAlign.end,
            ),
            Container(
              padding: EdgeInsets.all(9),
              margin: EdgeInsets.all(2),
              child: Text(
                news.content??'',
                style:Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black) ,
              ),
            ),
            Spacer(),
            IconButton(onPressed: (){
              launchURL(news.url??'');
            }, icon:
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('view full article',style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.grey,fontSize: 14),),
                Icon(Icons.arrow_right,size: 22,)
              ],
            ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
  launchURL(String url) async {

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
}
