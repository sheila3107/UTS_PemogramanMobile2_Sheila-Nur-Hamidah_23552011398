import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Import Cubit dan halaman yang akan digunakan
import 'blocs/cart_cubit.dart'; 
import 'models/product_model.dart'; 
import 'widgets/product_card.dart';
import 'pages/cart_summary_page.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Menyediakan CartCubit ke seluruh pohon widget (Wajib!)
    return BlocProvider(
      create: (context) => CartCubit(),
      child: MaterialApp(
        title: 'UTS Keranjang Dessert',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          useMaterial3: true,
        ),
        // Halaman utama yang pertama kali tampil
        home: const ProductListPage(), 
      ),
    );
  }
}

// Halaman utama: Menampilkan daftar produk (Tiramisu, Macaron, Cheesecake)
class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  // Daftar produk bertema Dessert
  final List<ProductModel> dessertProducts = const [
    ProductModel(
      id: 'D001',
      name: 'Tiramisu Klasik',
      price: 65000, 
      image: 'https://images.unsplash.com/photo-1571219278912-68c35a84594c',
    ),
    ProductModel(
      id: 'D002',
      name: 'Macaron Aneka Rasa',
      price: 45000, 
      image: 'https://images.unsplash.com/photo-1558327299-b1d50c76579b',
    ),
    ProductModel(
      id: 'D003',
      name: 'New York Cheesecake',
      price: 85000, 
      image: 'https://images.unsplash.com/photo-1565292415174-8b6ccf2b9631',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Dessert'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          // Tombol keranjang yang akan navigasi ke halaman summary
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CartSummaryPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          childAspectRatio: 0.7, 
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: dessertProducts.length,
        itemBuilder: (context, index) {
          return ProductCard(product: dessertProducts[index]);
        },
      ),
    );
  }
}