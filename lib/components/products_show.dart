import 'package:ecommerce_app/components/product_card.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:flutter/material.dart';

class ProductsShow extends StatefulWidget {
  const ProductsShow({super.key});

  @override
  State<ProductsShow> createState() => _ProductsShowState();
}

class _ProductsShowState extends State<ProductsShow> {
  List<Product> cartList = [];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: all.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return ProductCard(
            product: all[index],
            onTap: () {
              try {
                cartList
                    .firstWhere((element) => element.title == all[index].title);
                final snackBar = SnackBar(
                  backgroundColor: Colors.red,
                  content: const Text('This product already have been added!'),
                  action: SnackBarAction(
                    label: 'Go to Cart Page',
                    onPressed: () {
                      // Some code to undo the change.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CartScreen(
                                  cartList: cartList,
                                  colorIndex: 1,
                                )),
                      );
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } catch (e) {
                setState(() {
                  cartList.add(all[index]);
                  final snackBar = SnackBar(
                    backgroundColor: Colors.grey[800],
                    content:
                        const Text('This product  have been added to cart!'),
                    action: SnackBarAction(
                      label: 'Go to Cart Page',
                      onPressed: () {
                        // Some code to undo the change.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartScreen(
                                    cartList: cartList,
                                    colorIndex: 2,
                                  )),
                        );
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                });
              }
            },
          );
        });
  }
}
