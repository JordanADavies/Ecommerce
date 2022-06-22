import 'package:ecommerce/screens/products/domain/product.dart';
import 'package:ecommerce/screens/products/presentation/add_to_cart_button.dart';
import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  final Product product;

  const ProductListItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        tileColor: Colors.grey[200],
        leading: Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
          child: Image.network(product.image),
        ),
        title: Text(product.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(product.desciption),
            const SizedBox(height: 8.0),
            Text(
              '£${product.price}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16.0),
            AddToCartButton(product: product),
          ],
        ),
      ),
    );
  }
}
