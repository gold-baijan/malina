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
      // backgroundColor: Color(0xfffafafb),
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




 


// void showExampleBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     isScrollControlled: true,
//     backgroundColor: Colors.amberAccent,
//     context: context,
//     builder: (context) {
//       return SizedBox(
//         height:
//             MediaQuery.of(context).size.height * 0.95, // почти на весь экран
//         child: Scaffold(
//           appBar: AppBar(),
//           body: Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/add_background.svg'),
//               ),
//             ),
//             child: Column(children: [Container(height: 442)]),
//           ),
//         ),
//       );
//     },
//   );
// }











      // Column(
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         // Белая кнопка с серой обводкой (неактивная)
      //         Expanded(
      //           child: Padding(
      //             padding: const EdgeInsets.only(left: 20),
      //             child: Container(
      //               height: 48,
      //               margin: EdgeInsets.only(right: 8),
      //               child: OutlinedButton(
      //                 onPressed: () {},
      //                 style: OutlinedButton.styleFrom(
      //                   shape: StadiumBorder(),
      //                   side: BorderSide(color: Colors.grey.shade300),
      //                   backgroundColor: Colors.white,
      //                 ),
      //                 child: Text('Еда', style: TextStyle(color: Colors.black)),
      //               ),
      //             ),
      //           ),
      //         ),

      //         // Розовая кнопка (активная)
      //         Expanded(
      //           child: Padding(
      //             padding: const EdgeInsets.only(right: 20),
      //             child: Container(
      //               height: 48,
      //               margin: EdgeInsets.only(left: 8),
      //               child: ElevatedButton(
      //                 onPressed: () {},
      //                 style: ElevatedButton.styleFrom(
      //                   shape: StadiumBorder(),
      //                   backgroundColor: Color(0xFFFF2D55), // Ярко-розовый цвет
      //                   elevation: 0,
      //                 ),
      //                 child: Text(
      //                   'Бьюти',
      //                   style: TextStyle(color: Colors.white),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //     // SingleChildScrollView(
      //     //   scrollDirection: Axis.horizontal,
      //     //   child: Container(),
      //     // ),
      //   ],
      // ),
