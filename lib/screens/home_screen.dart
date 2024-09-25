import 'package:ecommerce_app/components/category_list_show.dart';
import 'package:ecommerce_app/components/image_slider.dart';
import 'package:ecommerce_app/components/my_app_bar.dart';
import 'package:ecommerce_app/components/my_search_bar.dart';
import 'package:ecommerce_app/components/products_show.dart';
import 'package:ecommerce_app/contstant.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                //AppBar
                const MyAppBar(),
                const SizedBox(height: 20),
                //Search bar
                const MySearchBar(),
                const SizedBox(height: 20),
                //Discount image
                const ImageSlider(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: kLightHeadlineText,
                    ),
                    Text(
                      'See all',
                      style: kSubHeadlineText,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                //Show Category
                const CategoryListShow(),
                const SizedBox(height: 20),
                //products show
                const ProductsShow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
