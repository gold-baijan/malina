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
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: BottomNavigationBar(
        selectedItemColor: Color(0xffF72055),
        unselectedItemColor: Color(0xffAAAAAA),
        elevation: 10,
        backgroundColor: Color(0xfff5f5fb),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/lenta.svg',
              color: currentIndex == 0 ? Color(0xffF72055) : Color(0xffAAAAAA),
            ),
            label: 'Лента',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/love.svg',
              color: currentIndex == 1 ? Color(0xffF72055) : Color(0xffAAAAAA),
            ),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 60, // Размер кнопки
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
              color: currentIndex == 3 ? Color(0xffF72055) : Color(0xffAAAAAA),
            ),
            label: 'Профиль',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/telezhka.svg',
              color: currentIndex == 4 ? Color(0xffF72055) : Color(0xffAAAAAA),
            ),
            label: 'Корзине',
          ),
        ],
        onTap: (index) => _handleTap(context, index),
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        selectedIconTheme: IconThemeData(color: Colors.red),
      ),
    );
  }
}
