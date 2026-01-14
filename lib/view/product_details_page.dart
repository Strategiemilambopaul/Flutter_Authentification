import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:l4_seance_2/cart_provider.dart';
import 'package:l4_seance_2/model/product_model.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({required this.product, super.key});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.nom_produit ?? 'Nom du produit'),
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[200],
              child: product.image_produit == null ||
                      product.image_produit!.isEmpty
                  ? Icon(Icons.image)
                  : Image.network(product.image_produit!)),
          const Gap(20),
          Text(
            product.nom_produit ?? 'Nom du produit',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Gap(10),
          Text(
            "${product.prix_produit?.toString()} \$ ",
            style: TextStyle(fontSize: 16),
          ),
          const Gap(10),
          Text(
            product.description_produit ?? 'Description du produit',
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
          ElevatedButton(
              onPressed: () => context.read<CartProvider>().add(product),
              child: Text('Ajouter au Panier !'))
        ],
      ),
    );
  }
}
