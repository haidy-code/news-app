import 'package:flutter/material.dart';

import 'CategoryItem.dart';

class Categories extends StatelessWidget {
  Function onCategoryClickCallBack;

  Categories(this.onCategoryClickCallBack);

  List<Category> categories = [
    Category(
        categoryId: 'sports',
        categoryName: 'Sports',
        imagePath: 'assets/images/sports.png',
        color: Color.fromARGB(255, 201, 28, 34)),
    Category(
        categoryId: 'general',
        categoryName: 'General',
        imagePath: 'assets/images/politics.png',
        color: Color.fromARGB(255, 0, 62, 144)),
    Category(
        categoryId: 'health',
        categoryName: 'Health',
        imagePath: 'assets/images/health.png',
        color: Color.fromARGB(255, 237, 30, 121)),
    Category(
        categoryId: 'business',
        categoryName: 'Business',
        imagePath: 'assets/images/bussines.png',
        color: Color.fromARGB(255, 207, 126, 72)),
    Category(
        categoryId: 'entertainment',
        categoryName: 'Entertainment',
        imagePath: 'assets/images/environment.png',
        color: Color.fromARGB(255, 72, 130, 207)),
    Category(
        categoryId: 'technology',
        categoryName: 'Technology',
        imagePath: 'assets/images/science.png',
        color: Color.fromARGB(255, 242, 211, 82)),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Pick your category \n of interest',
              style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
              itemBuilder: (buildcontext, index) {
                return CategoryItem(categories[index], index,(category){onCategoryClickCallBack(category);});
              },
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
