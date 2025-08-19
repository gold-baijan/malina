import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QrCodeScanConcainer extends StatelessWidget {
  const QrCodeScanConcainer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xffF72055),
          borderRadius: BorderRadius.circular(12),
        ),
        // margin: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/qr_phone.svg',
                width: 24,
                height: 68,
                // color: Colors.white, // если нужно перекрасить
              ),
              const SizedBox(width: 17),
              const Expanded(
                child: Text(
                  'Сканируй QR-код и \nзаказывай прямо в \nзаведении',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
