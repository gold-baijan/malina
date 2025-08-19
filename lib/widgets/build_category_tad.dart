import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_test/cubit/korzina/korzina_cubit.dart';
import 'package:malina_test/cubit/korzina/korzina_state.dart';
import 'package:malina_test/model/product_model.dart';
import 'package:malina_test/widgets/product_card.dart';

class BuildCategoryTab extends StatelessWidget {
  final String category;
  const BuildCategoryTab({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KorzinaCubit, KorzinaState>(
      builder: (context, state) {
        final items = state.products
            .where((e) => e.category == category)
            .toList();

        final Map<String, List<ProductModel>> grouped = {};
        for (var product in items) {
          grouped.putIfAbsent(product.subcategory, () => []).add(product);
        }

        if (grouped.isEmpty) {
          return const Center(child: Text('Нет данных'));
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: grouped.entries.map((entry) {
            final subcategory = entry.key;
            final products = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            subcategory,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff5F5F5F),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 13,
                            color: Color(0xff5F5F5F),
                          ),
                        ],
                      ),
                      Divider(color: Color(0xff5F5F5F)),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return ProductCard(product: product);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 20);
                        },
                        itemCount: products.length,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

