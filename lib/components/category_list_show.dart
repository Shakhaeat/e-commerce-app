import 'package:ecommerce_app/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryListShow extends StatefulWidget {
  const CategoryListShow({super.key});

  @override
  State<CategoryListShow> createState() => _CategoryListShowState();
}

class _CategoryListShowState extends State<CategoryListShow> {
  int currentCategory = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentCategory = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.all(10),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: currentCategory == index
                      ? Colors.transparent
                      : Colors.black,
                ),
                color: currentCategory == index ? Colors.green : Colors.white,
              ),
              child: Center(
                child: Text(
                  categoriesList[index].title,
                  style: TextStyle(
                      color: currentCategory == index
                          ? Colors.white
                          : Colors.black),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
