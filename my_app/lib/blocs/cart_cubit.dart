import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart';

class CartItem {
  ProductModel product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartCubit extends Cubit<List<CartItem>> {
  CartCubit() : super([]);

  void addToCart(ProductModel product) {
    final index = state.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      updateQuantity(product, state[index].quantity + 1);
    } else {
      emit([...state, CartItem(product: product)]);
    }
  }

  void removeFromCart(ProductModel product) {
    emit(state.where((item) => item.product.id != product.id).toList());
  }

  void updateQuantity(ProductModel product, int qty) {
    if (qty <= 0) {
      removeFromCart(product);
      return;
    }
    final newList = state.map((item) {
      if (item.product.id == product.id) {
        return CartItem(product: item.product, quantity: qty);
      }
      return item;
    }).toList();
    emit(newList);
  }

  void clearCart() {
    emit([]);
  }

  int get totalItems => state.fold(0, (sum, item) => sum + item.quantity);
  int get totalPrice => state.fold(0, (sum, item) => sum + item.product.price * item.quantity);
}
