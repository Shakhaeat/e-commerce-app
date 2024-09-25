import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

class DescriptionDetails extends StatelessWidget {
  final Product product;
  final void Function()? onTap;

  const DescriptionDetails(
      {super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.55,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red),
                  child: const Text(
                    '% on sale',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
              //Rating + Liking percentage
            ),
            const SizedBox(height: 10),
            //rating + liked + review
            Row(
              children: [
                ReviewWidget(
                  icon: Icons.star,
                  text: product.rate.toString(),
                  color: Colors.orange,
                ),
                const SizedBox(width: 10),
                const ReviewWidget(
                  icon: Icons.thumb_up_alt,
                  text: '94%',
                  color: Colors.green,
                ),
                const SizedBox(width: 10),
                Text(
                  product.review,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            //Product description
            Text(product.description),
            const SizedBox(height: 10),
            //Colors

            Row(
              children: [
                const Text(
                  'Colors: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 30,
                  width: 80,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: product.colors.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: product.colors[index],
                          ),
                        );
                      }),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      '\$650',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey),
                    ),
                    Text(
                      '\$${product.price}.00',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        // color: Colors.grey
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    // height: 50,
                    width: MediaQuery.of(context).size.height * .30,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green,
                    ),
                    child: const Center(
                        child: Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });

  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: 40,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade700),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: color,
          ),
          Text(text),
        ],
      ),
    );
  }
}
