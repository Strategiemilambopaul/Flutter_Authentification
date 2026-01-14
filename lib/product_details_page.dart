import "package:flutter/material.dart";
import "model/product_model.dart";


class ProductDetailsPage extends StatelessWidget {
  final String productName;
  final String productDescription;
  final double productPrice;

  const ProductDetailsPage({
    Key? key,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              productDescription,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '\$${productPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}