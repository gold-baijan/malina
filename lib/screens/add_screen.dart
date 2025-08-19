import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_test/cubit/add_prodict/add_product_cubit.dart';
import 'package:malina_test/cubit/add_prodict/add_product_state.dart';
import 'package:malina_test/model/product_model.dart';

class AddScreen extends StatelessWidget {
  final ProductModel? product;
  final _formKey = GlobalKey<FormState>();

  AddScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddProductCubit(product: product),
      child: BlocBuilder<AddProductCubit, AddProductState>(
        builder: (context, state) {
          final cubit = context.read<AddProductCubit>();

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xfffafafb),
              title: Text(state.isEditing ? 'Редактировать' : 'Добавить'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/add_background.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 17, left: 4, right: 4),
                  child: Form(
                    key: _formKey,

                    child: Column(
                      children: [
                        DropdownButtonFormField<String>(
                          value: state.category,
                          items: ['Еда', 'Бьюти']
                              .map(
                                (cat) => DropdownMenuItem(
                                  value: cat,
                                  child: Text(cat),
                                ),
                              )
                              .toList(),
                          onChanged: (val) => cubit.changeCategory(val!),
                          icon: const SizedBox.shrink(),
                          decoration: const InputDecoration(
                            labelText: 'Категория',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          initialValue: state.subcategory,
                          decoration: const InputDecoration(
                            labelText: 'Подкатегория',
                            border: OutlineInputBorder(),
                          ),
                          validator: (v) =>
                              v!.isEmpty ? 'Введите подкатегорию' : null,
                          onChanged: cubit.changeSubcategory,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          initialValue: state.title,
                          decoration: const InputDecoration(
                            labelText: 'Название',
                            border: OutlineInputBorder(),
                          ),
                          validator: (v) =>
                              v!.isEmpty ? 'Введите название' : null,
                          onChanged: cubit.changeTitle,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          initialValue: state.price,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Цена',
                            border: OutlineInputBorder(),
                          ),
                          validator: (v) =>
                              v!.isEmpty || double.tryParse(v) == null
                              ? 'Введите корректную цену'
                              : null,
                          onChanged: cubit.changePrice,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          initialValue: state.description,
                          decoration: const InputDecoration(
                            labelText: 'Описание',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 5,
                          onChanged: cubit.changeDescription,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffF72055),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    cubit.save();
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text(
                                  'Сохранить',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
