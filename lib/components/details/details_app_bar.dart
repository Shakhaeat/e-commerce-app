import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:flutter/material.dart';

class DetailsAppBar extends StatelessWidget {
  final cartList;
  const DetailsAppBar({super.key, required this.cartList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                // padding: const EdgeInsets.all(8),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                // color: Colors.black,
              )),
          const Spacer(),
          IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                // padding: const EdgeInsets.all(8),
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Colors.pink,
              )),
          const SizedBox(width: 8),
          IconButton(
              tooltip: 'Shopping Cart',
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                // padding: const EdgeInsets.all(8),
              ),
              onPressed: () {
                // Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => CartScreen(cartList: cartList));
              },
              icon: const Icon(
                Icons.shopping_cart,
                // color: Colors.black,
              )),
        ],
      ),
    );
  }
}
