import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:malina_test/model/product_model.dart';
import 'korzina_state.dart';

class KorzinaCubit extends Cubit<KorzinaState> {
  final Box<ProductModel> productBox;

  KorzinaCubit(this.productBox) : super(const KorzinaState()) {
    loadProducts();
  }

  void loadProducts() {
    final products = productBox.values.toList();
    emit(state.copyWith(products: products));
  }

  void deleteProduct(ProductModel product) {
    product.delete();
    loadProducts();
  }

  void clearCategory(String category) {
    final toDelete = productBox.values.where((p) => p.category == category).toList();
    for (var p in toDelete) {
      p.delete();
    }
    loadProducts();
  }

  
}

