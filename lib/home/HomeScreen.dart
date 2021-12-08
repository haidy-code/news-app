import 'package:flutter/material.dart';
import 'package:news_app/home/categories/Categories.dart';
import 'package:news_app/home/categories/CategoryItem.dart';

import 'categories/CategoryDetails.dart';

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
            color: Colors.white,
            child: Image.asset(
              'assets/images/pattern.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            )),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('News Application'),
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
                  onTap: (){
                    Navigator.pop(context);//3shan a2fl side menu
                    setState(() {
                      selectedcategory=null;
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
          body:selectedcategory==null? Categories(onCategoryClickCallBack):
          CategoryDetails(selectedcategory!),
        )
      ],
    );
  }
Category? selectedcategory=null;
 void onCategoryClickCallBack(Category category) {
   print(category.categoryName);
   setState(() {
     selectedcategory=category;
   });
  }
}
