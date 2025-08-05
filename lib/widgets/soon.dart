import 'package:flutter/material.dart';
import 'package:malina_test/widgets/soon_card.dart';

class SoonRow extends StatelessWidget {
  const SoonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16 , bottom: 8),
          child: const Text('Скоро в Malina', style: TextStyle(fontSize: 16)),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              SizedBox(width: 8),
              SoonCard(title: 'Вакансии', backgroundColor: Color(0xffD4E5FF),),
              SizedBox(width: 8),
              SoonCard(title: 'Маркет', backgroundColor: Color(0xffFFD3BA),),
              SizedBox(width: 8),
              SoonCard(title: 'Цветы', backgroundColor: Color(0xffFFDEDE),),
              SizedBox(width: 8),
              SoonCard(title: 'Услуги', backgroundColor: Color(0xffCFF2E3),),
              SizedBox(width: 8),
              SoonCard(title: 'Спорт', backgroundColor: Color.fromARGB(255, 239, 254, 199),),
              SizedBox(width: 8),
              SoonCard(title: 'Питомцы', backgroundColor: Color.fromARGB(255, 208, 212, 255),),
              SizedBox(width: 8),
            ],
          ),
        ),
      ],
    );
  }
}