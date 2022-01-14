import 'package:flutter/material.dart';
import 'package:news_app/home/categories/CategoryItem.dart';
import 'package:news_app/home/data/ApiManager.dart';
import 'package:news_app/home/data/sourses_response.dart';

import 'CategoryTabsWidget.dart';
//hena bn3ml call llapi w ngeb mno data
class CategoryDetails extends StatelessWidget {
  Category category;

  CategoryDetails(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<SourcesResponse>(
        future: ApiManager.loadNewsSources(category.categoryId),// future hwa al7aga ally hastanaha ally hwa alsources ally hatrga3
        builder:
            (BuildContext context, AsyncSnapshot<SourcesResponse> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

               return CategoryTabsWidget(snapshot.data?.sources ?? []);//ba3att llcategorytabswidget list of sources ally rag3aly mn api
        },
      ),
    );
  }
}
