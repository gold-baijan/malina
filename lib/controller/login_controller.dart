import 'package:flutter/material.dart';
import 'package:malina_test/screens/home_screen.dart';

class LoginController {
  static void validateAndLogin({
    required BuildContext context,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required List<Map<String, String>> validAccounts,
    required void Function(String? emailError, String? passwordError) onValidationResult,
  }) {
    final email = emailController.text.trim();
    final password = passwordController.text;

    String? emailError;
    String? passwordError;
    bool isValid = true;

    if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,4}$').hasMatch(email)) {
      emailError = 'Введите корректную почту';
      isValid = false;
    }

    if (password.length < 8) {
      passwordError = 'Пароль должен содержать минимум 8 символов';
      isValid = false;
    }

    if (isValid) {
      final match = validAccounts.any(
        (acc) => acc['email'] == email && acc['password'] == password,
      );

      if (match) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
        return;
      } else {
        passwordError = 'Неверная почта или пароль';
      }
    }

    onValidationResult(emailError, passwordError);
  }
}
