import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart'; 
import '../blocs/cart_cubit.dart'; 

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();

    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Gambar Produk
          Expanded(
            child: Image.network(
              product.image,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => 
                  const Center(child: Icon(Icons.cake, size: 40, color: Colors.grey)),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Nama Produk
                Text(
                  product.name,
                  style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                
                // Harga Produk
                Text(
                  'Rp ${product.price.toStringAsFixed(0)}',
                  style: TextStyle(fontSize: 14.0, color: Colors.green[700]),
                ),
                
                const SizedBox(height: 8.0),
                
                // Tombol Tambah ke Keranjang
                ElevatedButton.icon(
                  onPressed: () {
                    cartCubit.addToCart(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${product.name} ditambahkan!'),
                        duration: const Duration(milliseconds: 700),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add_shopping_cart, size: 18),
                  label: const Text('Tambah'),
                  style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 35)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}