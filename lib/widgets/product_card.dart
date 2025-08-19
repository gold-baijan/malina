import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:malina_test/cubit/korzina/korzina_cubit.dart';
import 'package:malina_test/model/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      color: Colors.white,
      child: Row(
        children: [
          ClipRRect( borderRadius: BorderRadiusGeometry.circular(10),
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),),
              child: Image.asset('assets/images/malina.png'),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    '${product.title} ${product.price} сом',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    product.description,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceEvenly, // или center
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffF8F8F8),
                              borderRadius:
                                  BorderRadius.all(
                                    Radius.circular(9.44),
                                  ),
                            ),
                            child: Center(
                              child: Icon(Icons.remove),
                            ),
                          ),
                          Text('1'),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffF8F8F8),
                              borderRadius:
                                  BorderRadius.all(
                                    Radius.circular(9.44),
                                  ),
                            ),
                            child: Center(
                              child: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => context
                                .read<KorzinaCubit>()
                                .deleteProduct(product),
                            child: SvgPicture.asset('assets/icons/delete.svg')
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
