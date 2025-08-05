import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta! > 20) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xfffafafb),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [const Text("Добавить")],
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Сканировать',
                style: TextStyle(
                  color: Color(0xff1d1d1d),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
          backgroundColor:
              // Colors.blueGrey,
              Color(0xfffafafb),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/add_background.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 17, left: 4, right: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      hoverColor: Color(0xff79747E),
                      hintText: 'Категория',
                      filled: true,
                      fillColor: Colors.transparent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: Color(0xff79747E)),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      hoverColor: Color(0xff79747E),
                      hintText: 'Подкатегория',
                      filled: true,
                      fillColor: Colors.transparent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: Color(0xff79747E)),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      hoverColor: Color(0xff79747E),
                      hintText: 'Название',
                      filled: true,
                      fillColor: Colors.transparent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: Color(0xff79747E)),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      hoverColor: Color(0xff79747E),
                      hintText: 'Цена ',
                      filled: true,
                      fillColor: Colors.transparent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: Color(0xff79747E)),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('Описание'),
                  ),
                  SizedBox(height: 12),
                  TextField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 40.0),
                      hoverColor: Color(0xff79747E),
                      fillColor: Colors.transparent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: Color(0xff79747E)),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              Color(0xffF72055),
                            ),
                            foregroundColor: WidgetStateProperty.all(
                              Colors.white,
                            ),
                          ),
                          child: Text('Сохранить'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
