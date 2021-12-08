import 'package:flutter/material.dart';
import 'package:news_app/home/data/sports_response.dart';
import 'package:news_app/home/news/NewsListWidget.dart';

import 'TabItem.dart';

class CategoryTabsWidget extends StatefulWidget {
  List<Sources> sources;

  CategoryTabsWidget(this.sources);

  @override
  State<CategoryTabsWidget> createState() => _CategoryTabsWidgetState();
}

class _CategoryTabsWidgetState extends State<CategoryTabsWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        initialIndex: 0,
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
                padding: EdgeInsets.all(8),
                indicatorColor: Colors.transparent,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                //map bt7wl source ltab item
                tabs: widget.sources
                    .map((element) => TabItem(element,
                        selectedIndex == widget.sources.indexOf(element)))
                    .toList())
            ,NewsListWidget(
              source: widget.sources[selectedIndex],
            )
          ],
        ),
      ),
    );
  }
}
