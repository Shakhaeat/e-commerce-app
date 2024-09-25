import 'package:ecommerce_app/contstant.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Discover',
          style: kHeadlineText,
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
              ),
            ),
            Positioned(
              right: 0,
              top: -3,
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                    child: Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
