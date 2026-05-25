import 'package:flutter/material.dart';
import 'create_account.dart';

void main() {
  runApp(const MyApp());
}

const Color primaryColor = Color(0xFF2F54FF);
const Color titleColor = Color(0xFF1E293B);
const Color hintColor = Color(0xFF64748B);
const Color focusBorderColor = Color(0xFF3B82F6);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FPT Account UI',
      theme: ThemeData(
        fontFamily: 'Calibri',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      ),
      home: const ResetPasswordScreen(),
    );
  }
}

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool hidePassword1 = true;
  bool hidePassword2 = true;

  InputDecoration inputDecoration({
    required String label,
    required String hint,
    required bool obscure,
    required VoidCallback onToggle,
    Color? fillColor,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(color: titleColor, fontWeight: FontWeight.w600),
      hintStyle: const TextStyle(color: hintColor),
      filled: fillColor != null,
      fillColor: fillColor,
      suffixIcon: IconButton(
        icon: Icon(
          obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: hintColor,
        ),
        onPressed: onToggle,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: focusBorderColor, width: 1.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom -
                48,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/images/logo_fpt.png',
                    width: 90,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text(
                        'FPT',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 60),

                const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: titleColor,
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  'Enter your new password twice below to reset your account password.',
                  style: TextStyle(
                    fontSize: 16,
                    color: hintColor,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 36),

                TextField(
                  obscureText: hidePassword1,
                  decoration: inputDecoration(
                    label: 'Enter new password',
                    hint: 'Your password',
                    obscure: hidePassword1,
                    onToggle: () {
                      setState(() {
                        hidePassword1 = !hidePassword1;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  obscureText: hidePassword2,
                  decoration: inputDecoration(
                    label: 'Re-enter new password',
                    hint: '••••••••••••••',
                    obscure: hidePassword2,
                    fillColor: Colors.grey.shade100,
                    onToggle: () {
                      setState(() {
                        hidePassword2 = !hidePassword2;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateAccountScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const Spacer(),

                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateAccountScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Create an account',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}