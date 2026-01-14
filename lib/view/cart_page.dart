import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:l4_seance_2/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Mon Panier"),
            actions: [
              IconButton(
                  onPressed: () {
                    value.clearCart();
                  },
                  icon: Icon(Icons.delete_forever))
            ],
          ),
          body: value.items.isEmpty
              ? Center(
                  child: Text("Votre Panier est vide"),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: value.items.length,
                          itemBuilder: (context, index) {
                            final product = value.items[index];
                            return ListTile(
                              leading: Icon(Icons.check),
                              title: Text(product.nom_produit ?? '-'),
                              subtitle: Text(
                                  '${product.prix_produit.toString()} \$ '),
                              trailing: IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () => value.remove(product),
                              ),
                            );
                          }),
                    ),
                    Row(
                      children: [
                        Text(
                          'Total : ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${value.totalPrice.toString()} \$ ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Gap(25)
                  ],
                ),
        );
      },
    );
  }
}
