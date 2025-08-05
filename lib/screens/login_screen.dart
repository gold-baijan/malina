import 'package:flutter/material.dart';
import 'package:malina_test/controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;
  bool _obscurePassword = true;

  final List<Map<String, String>> _validAccounts = [
    {'email': 'user1@example.com', 'password': 'password123'},
    {'email': 'test@example.com', 'password': 'qwerty123'},
    {'email': 'demo@demo.com', 'password': 'demopass8'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(border: Border()),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  errorText: _emailError,
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  suffixIcon: _emailController.text.isNotEmpty
                      ? IconButton(
                          icon: const ImageIcon(
                            AssetImage('assets/icons/x.png'),
                            size: 20,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            _emailController.clear();
                            setState(() => _emailError = null);
                          },
                        )
                      : null,
                  hintText: 'Почта',
                ),
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Пароль',
                errorText: _passwordError,
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() => _obscurePassword = !_obscurePassword);
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                LoginController.validateAndLogin(
                  context: context,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  validAccounts: _validAccounts,
                  onValidationResult: (emailError, passwordError) {
                    setState(() {
                      _emailError = emailError;
                      _passwordError = passwordError;
                    });
                  },
                );
              },
              child: const Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }
}
