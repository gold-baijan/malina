import 'package:flutter/material.dart';
import 'package:malina_test/widgets/lenta_card.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [Container(color: Color(0xffFFDF94),),
            LentaCard(
              title: 'Еда',
              subtitle: 'Из кафе и \nресторанов',
              imagePath: 'assets/images/food.png',
              // overlayColor: Color(0xffFFDF94),
            ),
          ],
        ),
        const SizedBox(height: 12),
        LentaCard(
          title: 'Бьюти',
          subtitle: 'Салоны красоты \nи товары',
          imagePath: 'assets/images/beautie.png',
          overlayColor: Color(0xffffdedd),
        ),
        SizedBox(height: 30,)
      ],
    );
  }
}
