import 'package:ecommerce_app/components/details/description_details.dart';
import 'package:ecommerce_app/components/details/details_app_bar.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  const ProductDetails({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final List<Product> _cartList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F3F2),
      body: SafeArea(
        child: Column(
          children: [
            //go back + favourite + download button
            DetailsAppBar(
              cartList: _cartList,
            ),
            //Detail product Pic
            SizedBox(height: 250, child: Image.asset(widget.product.image)),
            //description product
            DescriptionDetails(
              product: widget.product,
              onTap: () {
                try {
                  _cartList.firstWhere(
                      (element) => element.title == widget.product.title);
                  final snackBar = SnackBar(
                    backgroundColor: Colors.red,
                    content:
                        const Text('This product already have been added!'),
                    action: SnackBarAction(
                      label: 'Go to Cart Page',
                      onPressed: () {
                        // Some code to undo the change.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartScreen(
                                    cartList: _cartList,
                                    colorIndex: 1,
                                  )),
                        );
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } catch (e) {
                  setState(() {
                    _cartList.add(widget.product);
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
                                      cartList: _cartList,
                                      colorIndex: 1,
                                    )),
                          );
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
