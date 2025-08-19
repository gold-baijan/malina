import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_test/model/product_model.dart';
import 'package:malina_test/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<ProductModel>('products');

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      // home: const LoginScreen(),
      home: const HomeScreen(),
      //вернуть экран логин 
    );
  }
}