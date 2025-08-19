import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:malina_test/cubit/korzina/korzina_cubit.dart';
import 'package:malina_test/cubit/korzina/korzina_state.dart';
import 'package:malina_test/model/product_model.dart';
import 'package:malina_test/screens/add_screen.dart';
import 'package:malina_test/widgets/build_category_tad.dart';

class KorzinaScreen extends StatelessWidget {
  const KorzinaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => KorzinaCubit(Hive.box<ProductModel>('products')),
      child: BlocBuilder<KorzinaCubit, KorzinaState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color(0xfffafafb),
                  surfaceTintColor: Colors.transparent,
                  title: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                      const Text('Корзина'),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        final tabIndex = DefaultTabController.of(context).index;
                        final category = tabIndex == 0 ? 'Еда' : 'Бьюти';
                        context.read<KorzinaCubit>().clearCategory(category);
                      },
                      child: TextButton(
                        onPressed: () {
                          // context.read<KorzinaCubit>().clearCategory(
                          DefaultTabController.of(context).index == 0
                              ? 'Еда'
                              : 'Бьюти';
                        },
                        child: Text(
                          'Очистить',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                  bottom: ButtonsTabBar(
                    contentCenter: true,
                    width: 170,
                    buttonMargin: const EdgeInsets.symmetric(horizontal: 8),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 50),
                    borderWidth: 1,
                    borderColor: const Color(0xffEDEBEB),
                    unselectedBorderColor: const Color(0xffEDEBEB),
                    radius: 100,
                    backgroundColor: const Color(0xffF72055),
                    unselectedBackgroundColor: Colors.transparent,
                    unselectedLabelStyle: const TextStyle(color: Colors.black),
                    tabs: const [
                      Tab(text: 'Еда'),
                      Tab(text: 'Бьюти'),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    BuildCategoryTab(category: 'Еда'),
                    BuildCategoryTab(category: 'Бьюти'),
                  ],
                ),
                backgroundColor: Color(0xfffafafb),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => AddScreen()));
                context.read<KorzinaCubit>().loadProducts();
              },
              backgroundColor: const Color(0xffECE6F0),
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
