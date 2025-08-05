import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:malina_test/screens/add_screen.dart';
import 'package:malina_test/screens/korzina_screens/beauty.dart';
import 'package:malina_test/screens/korzina_screens/food.dart';

class KorzinaScreen extends StatefulWidget {
  const KorzinaScreen({super.key});

  @override
  State<KorzinaScreen> createState() => _KorzinaScreenState();
}

class _KorzinaScreenState extends State<KorzinaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xfffafafb),
            surfaceTintColor: Colors.transparent,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                const Text('Корзина'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Очистить',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
            bottom: ButtonsTabBar(
              // decoration:BoxDecoration(),
              contentCenter: true,
              width: 170,
              buttonMargin: EdgeInsets.symmetric(horizontal: 8),
              contentPadding: EdgeInsets.symmetric(horizontal: 50),
              borderWidth: 1,
              borderColor: Color(0xffEDEBEB),
              unselectedBorderColor: Color(0xffEDEBEB),
              radius: 100,
              backgroundColor: Color(0xffF72055),
              unselectedBackgroundColor: Colors.transparent,
              unselectedLabelStyle: TextStyle(color: Colors.black),
              tabs: [
                Tab(text: 'Еда'),
                Tab(text: 'Бьюти'),
              ],
            ),
          ),
          body: TabBarView(children: [FoodScreen(), BeautyScreen()]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const AddScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, 1.0); // снизу вверх
                    const end = Offset.zero;
                    const curve = Curves.ease;
                    var tween = Tween(
                      begin: begin,
                      end: end,
                    ).chain(CurveTween(curve: curve));
                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}




 

