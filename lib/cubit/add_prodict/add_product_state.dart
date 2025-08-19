import 'package:malina_test/model/product_model.dart';

class AddProductState {
  final bool isEditing;
  final String category;
  final String subcategory;
  final String title;
  final String price;
  final String description;
  final bool isSaving;
  final bool saveSuccess;
  final int quantity;

  const AddProductState({
    this.isEditing = false,
    this.category = 'Еда',
    this.subcategory = '',
    this.title = '',
    this.price = '',
    this.description = '',
    this.isSaving = false,
    this.saveSuccess = false,
    this.quantity = 1,
  });

  factory AddProductState.fromProduct(ProductModel product) {
    return AddProductState(
      isEditing: true,
      category: product.category,
      subcategory: product.subcategory,
      title: product.title,
      price: product.price,
      description: product.description,
    );
  }

  AddProductState copyWith({
    bool? isEditing,
    String? category,
    String? subcategory,
    String? title,
    String? price,
    String? description,
    bool? isSaving,
    bool? saveSuccess,
  }) {
    return AddProductState(
      isEditing: isEditing ?? this.isEditing,
      category: category ?? this.category,
      subcategory: subcategory ?? this.subcategory,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      isSaving: isSaving ?? this.isSaving,
      saveSuccess: saveSuccess ?? this.saveSuccess,
    );
  }

}