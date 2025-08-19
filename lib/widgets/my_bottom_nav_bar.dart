import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:malina_test/screens/qr_scanner_screen.dart';

class MyBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onItemTapped;

  const MyBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  void _handleTap(BuildContext context, int index) {
    if (index == 2) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => QRScannerScreen()));
    } else {
      onItemTapped(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(12);

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: radius,
          topRight: radius,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: radius,
          topRight: radius,
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xfff5f5fb), // фон теперь обрезается
          elevation: 0, // тень даёт контейнер выше
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) => _handleTap(context, index),
          selectedItemColor: const Color(0xffF72055),
          unselectedItemColor: const Color(0xffAAAAAA),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          selectedIconTheme: const IconThemeData(color: Colors.red),
          
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/lenta.svg',
                color: currentIndex == 0
                    ? const Color(0xffF72055)
                    : const Color(0xffAAAAAA),
              ),
              label: 'Лента',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/love.svg',
                color: currentIndex == 1
                    ? const Color(0xffF72055)
                    : const Color(0xffAAAAAA),
              ),
              label: 'Избранное',
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                  color: Color(0xffF72055),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x33F72055),
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: SizedBox(
                    height: 26.5,
                    width: 26.5,
                    child: SvgPicture.asset(
                      'assets/icons/qr_bnb.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/profile.svg',
                color: currentIndex == 3
                    ? const Color(0xffF72055)
                    : const Color(0xffAAAAAA),
              ),
              label: 'Профиль',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/telezhka.svg',
                color: currentIndex == 4
                    ? const Color(0xffF72055)
                    : const Color(0xffAAAAAA),
              ),
              label: 'Корзина',
            ),
          ],
        ),
      ),
    );
  }
}
