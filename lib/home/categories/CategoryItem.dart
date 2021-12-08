import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  int index;
  Function onCategoryClick;
  CategoryItem(this.category, this.index,this.onCategoryClick);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){onCategoryClick(category);},//hab3at call bach llcategories w al categories tb3at call back llhome 3shan alhome t8air content bta3ha
      child: Container(
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(24) ,
            topRight: Radius.circular(24),
            bottomLeft:Radius.circular(index%2==0?24:0) ,
            bottomRight: Radius.circular(index%2==0?0:24)
          )
        ),
        child: Column(
          children: [
            Image.asset(category.imagePath,height: 120),//7tat height 3shan swar kolha tb2a nafs alheight
            Text(category.categoryName,style:Theme.of(context).textTheme.headline4,)
          ],
        ),
      ),
    );
  }

}

class Category {
  String categoryId;
  String categoryName;
  String imagePath;
  Color color;

  Category(
      {required this.categoryId,
        required this.categoryName,
        required this.imagePath,
        required this.color});
}

