import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/home/categories/Categories.dart';
import 'package:news_app/home/categories/CategoryItem.dart';
import 'package:news_app/home/data/news_response.dart';

import 'categories/CategoryDetails.dart';
import 'data/ApiManager.dart';
import 'news/NewsItemWidget.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: Colors.white, //7tan llcontainer white 3shan alsora tban
            child: Image.asset(
              'assets/images/pattern.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            )),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('News Application'),
                IconButton(
                    onPressed: () {
                      showSearch(context: context, delegate: NewsSearch());
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ))
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
          ),
          drawer: Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 48),
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'News App',
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context); //3shan a2fl side menu
                    setState(() {
                      selectedcategory = null;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.list,
                          size: 36,
                        ),
                        Text('Categories',
                            style: Theme.of(context).textTheme.headline5)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 36,
                      ),
                      Text('Settings',
                          style: Theme.of(context).textTheme.headline5)
                    ],
                  ),
                )
              ],
            ),
          ),
          body: selectedcategory == null
              ? Categories(onCategoryClickCallBack)
              : CategoryDetails(selectedcategory!),
        )
      ],
    );
  }

  Category? selectedcategory = null;
  void onCategoryClickCallBack(Category category) {
    print(category.categoryName);
    setState(() {
      selectedcategory = category;
    });
  }
}

class NewsSearch extends SearchDelegate {
  late Future<News_response> newsresponse;

  NewsSearch() {
    newsresponse = ApiManager.loadNews(query: query);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            newsresponse = ApiManager.loadNews(
                query:
                    query); //call ll api 3shan t3rdly results bta3t alquery ally mda5lah
            showResults(context); //hatnady 3la build results
          },
          icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.clear));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container(
      color: Colors.white,
      child: FutureBuilder<News_response>(
        future: newsresponse,
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

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Text('suggestions'));
  }
}
