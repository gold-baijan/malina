import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:malina_test/model/product_model.dart';
import 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({ProductModel? product})
    : super(
        product != null
            ? AddProductState.fromProduct(product)
            : const AddProductState(),
      );

  void changeCategory(String category) {
    emit(state.copyWith(category: category));
  }

  void changeSubcategory(String subcategory) {
    emit(state.copyWith(subcategory: subcategory));
  }

  void changeTitle(String title) {
    emit(state.copyWith(title: title));
  }

  void changePrice(String price) {
    emit(state.copyWith(price: price));
  }

  void changeDescription(String description) {
    emit(state.copyWith(description: description));
  }

  Future<void> save() async {
    emit(state.copyWith(isSaving: true));

    final productBox = Hive.box<ProductModel>('products');
    final newProduct = ProductModel(
      category: state.category,
      subcategory: state.subcategory,
      title: state.title,
      price: state.price,
      description: state.description,
      // quantity: state.quantity ?? 1,
    );

    if (state.isEditing) {
      final existing = productBox.values.firstWhere(
        (p) => p.title == state.title, // Здесь можно поменять логику поиска
        orElse: () => newProduct,
      );
      existing
        ..category = newProduct.category
        ..subcategory = newProduct.subcategory
        ..title = newProduct.title
        ..price = newProduct.price
        ..description = newProduct.description
        ..save();
    } else {
      await productBox.add(newProduct);
    }

    emit(state.copyWith(isSaving: false, saveSuccess: true));
  }
}
