import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:collection';
import '../models/product_model.dart'; 

// State keranjang: Map<Produk, Kuantitas>
typedef CartState = LinkedHashMap<ProductModel, int>;

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(LinkedHashMap());

  void addToCart(ProductModel product) {
    final currentCart = LinkedHashMap<ProductModel, int>.from(state);
    if (currentCart.containsKey(product)) {
      currentCart[product] = currentCart[product]! + 1;
    } else {
      currentCart[product] = 1;
    }
    emit(currentCart); 
  }

  void removeFromCart(ProductModel product) {
    final currentCart = LinkedHashMap<ProductModel, int>.from(state);
    if (!currentCart.containsKey(product)) return;
    if (currentCart[product]! > 1) {
      currentCart[product] = currentCart[product]! - 1;
    } else {
      currentCart.remove(product);
    }
    emit(currentCart);
  }

  void updateQuantity(ProductModel product, int qty) {
    if (qty < 0) return;
    final currentCart = LinkedHashMap<ProductModel, int>.from(state);
    if (currentCart.containsKey(product)) {
      if (qty == 0) {
        currentCart.remove(product);
      } else {
        currentCart[product] = qty;
      }
      emit(currentCart);
    }
  }

  void clearCart() {
    // Mengosongkan keranjang (dipanggil saat Checkout)
    emit(LinkedHashMap()); 
  }

  int getTotalItems() {
    // Menghitung jumlah produk unik
    return state.length; 
  }
  
  int getTotalPrice() {
    // Menghitung total harga
    int total = 0;
    state.forEach((product, quantity) {
      total += product.price * quantity;
    });
    return total;
  }
}