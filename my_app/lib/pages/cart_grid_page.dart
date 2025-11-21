import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_cubit.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import 'cart_summary_page.dart';

class CartGridPage extends StatelessWidget {
  const CartGridPage({super.key});

  final List<ProductModel> products = const [
    ProductModel(
      id: 'D001',
      name: 'Cheesecake',
      price: 50000,
      image: 'assets/images/cheesecake.jpg',
    ),
    ProductModel(
      id: 'D002',
      name: 'macaron Cake',
      price: 45000,
      image: 'assets/images/macaron.jpg',
    ),
    ProductModel(
      id: 'D003',
      name: 'tiramisu cake',
      price: 60000,
      image: 'assets/images/tiramisu.jpg',
    ),
    ProductModel(
      id: 'D004',
      name: 'Bagels',
      price: 30000,
      image: 'assets/images/bagels.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // HEADER INFO
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.pink.shade200, Colors.pink.shade100]),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Inoi Dessert Menu",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Stack(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.shopping_cart, color: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const CartSummaryPage()),
                          );
                        },
                      ),
                      Positioned(
                        right: 6,
                        top: 6,
                        child: BlocBuilder<CartCubit, List<CartItem>>(
                          builder: (context, cartItems) {
                            if (cartItems.isEmpty) return const SizedBox.shrink();
                            return CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.red,
                              child: Text(
                                '${context.read<CartCubit>().totalItems}',
                                style: const TextStyle(fontSize: 12, color: Colors.white),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // GRID PRODUK
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.7, crossAxisSpacing: 10, mainAxisSpacing: 10),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
