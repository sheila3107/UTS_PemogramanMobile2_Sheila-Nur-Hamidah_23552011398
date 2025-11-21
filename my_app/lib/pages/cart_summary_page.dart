import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_cubit.dart'; 

class CartSummaryPage extends StatelessWidget {
  const CartSummaryPage({super.key});

  String _formatPrice(int price) {
    // Fungsi untuk mengubah 65000 menjadi Rp 65.000
    return 'Rp ${price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    )}';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, cartState) {
        final cartItems = cartState.entries.toList();
        final cartCubit = context.read<CartCubit>();
        final totalPrice = cartCubit.getTotalPrice();

        return Scaffold(
          appBar: AppBar(
            title: const Text('Ringkasan Keranjang'),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
          body: cartItems.isEmpty
              ? const Center(
                  child: Text('Keranjang masih kosong!', style: TextStyle(fontSize: 18)),
                )
              : Column(
                  children: <Widget>[
                    // Daftar Produk di Keranjang
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final entry = cartItems[index];
                          final product = entry.key;
                          final quantity = entry.value;

                          return ListTile(
                            leading: CircleAvatar(
                              // Menggunakan gambar produk
                              backgroundImage: NetworkImage(product.image),
                              onBackgroundImageError: (e, s) => const Icon(Icons.cake),
                            ),
                            title: Text('${product.name} (${quantity}x)'),
                            subtitle: Text(_formatPrice(product.price)),
                            trailing: Text(
                              _formatPrice(product.price * quantity),
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                            ),
                          );
                        },
                      ),
                    ),
                    
                    const Divider(height: 1, thickness: 1),

                    // Area Total & Checkout
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Total Item Unik:'),
                              Text('${cartCubit.getTotalItems()}'),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Total Harga:', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(
                                _formatPrice(totalPrice),
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // Tombol Checkout (memanggil clearCart())
                          ElevatedButton(
                            onPressed: () {
                              cartCubit.clearCart(); 
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Checkout berhasil! Keranjang dikosongkan.')),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              backgroundColor: Colors.indigo,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Checkout', style: TextStyle(fontSize: 18)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}