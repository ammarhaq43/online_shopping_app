import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../models/cart_provider.dart';
import '../../../models/product.dart';
import '../../home/components/checkout_page.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key, required this.product});

  final Product product;

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int quantity = 1; // Initial quantity
  int unitPrice = 234; // Price per unit

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            // Add to Cart Button
            Container(
              margin: const EdgeInsets.only(right: kDefaultPaddin),
              height: 50,
              width: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: widget.product.color),
              ),
              child: IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                color: widget.product.color,
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false)
                      .addToCart(widget.product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Item added to cart!")),
                  );
                },
              ),
            ),
            // Buy Now Button
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to checkout
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckoutPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.product.color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: Text(
                  "Buy Now".toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Plus-Minus Container
            Container(
              margin: const EdgeInsets.only(left: kDefaultPaddin),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: widget.product.color),
              ),
              child: Row(
                children: [
                  // Minus Button
                  IconButton(
                    icon: const Icon(Icons.remove),
                    color: widget.product.color,
                    onPressed: decreaseQuantity,
                  ),
                  // Quantity Display
                  Text(
                    "$quantity",
                    style: TextStyle(
                      color: widget.product.color,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Plus Button
                  IconButton(
                    icon: const Icon(Icons.add),
                    color: widget.product.color,
                    onPressed: increaseQuantity,
                  ),
                ],
              ),
            ),
          ],
        ),
        // Display Total Price below the buttons
        Padding(
          padding: const EdgeInsets.only(top: kDefaultPaddin),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Total: \$${quantity * unitPrice}",
              style: TextStyle(
                color: widget.product.color,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
