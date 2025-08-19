import 'package:malina_test/model/product_model.dart';

class KorzinaState {
  final List<ProductModel> products;
  final bool isLoading;

  const KorzinaState({
    this.products = const [],
    this.isLoading = false,
  });

  KorzinaState copyWith({
    List<ProductModel>? products,
    bool? isLoading,
  }) {
    return KorzinaState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
    );
  }

}