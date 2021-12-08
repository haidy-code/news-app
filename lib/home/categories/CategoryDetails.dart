import 'package:flutter/material.dart';
import 'package:news_app/home/categories/CategoryItem.dart';
import 'package:news_app/home/data/ApiManager.dart';
import 'package:news_app/home/data/sports_response.dart';

import 'CategoryTabsWidget.dart';

class CategoryDetails extends StatelessWidget {
  Category category;

  CategoryDetails(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<SportsResponse>(
        future: ApiManager.loadNewsSources(category.categoryId),// future hwa al7aga ally hastanaha ally hwa alsources ally hatrga3
        builder:
            (BuildContext context, AsyncSnapshot<SportsResponse> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

               return CategoryTabsWidget(snapshot.data?.sources ?? []);
        },
      ),
    );
  }
}
