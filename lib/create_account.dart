import 'package:flutter/material.dart';
import 'congratulations.dart';

const Color primaryColor = Color(0xFF2F54FF);
const Color titleColor = Color(0xFF1E293B);
const Color hintColor = Color(0xFF64748B);
const Color focusBorderColor = Color(0xFF3B82F6);

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool hidePassword = true;

  InputDecoration inputDecoration({
    required String label,
    required String hint,
    required IconData prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(prefixIcon, color: hintColor),
      suffixIcon: suffixIcon,
      labelStyle: const TextStyle(color: titleColor, fontWeight: FontWeight.w600),
      hintStyle: const TextStyle(color: hintColor),
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

  Widget backButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          size: 20,
          color: titleColor,
        ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    backButton(context),
                    Image.asset(
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
                  ],
                ),

                const SizedBox(height: 50),

                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: titleColor,
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  'Fill in your information below to create a new FPT user account.',
                  style: TextStyle(
                    fontSize: 16,
                    color: hintColor,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 32),

                TextField(
                  decoration: inputDecoration(
                    label: 'Username',
                    hint: 'Nhập username',
                    prefixIcon: Icons.person_outline,
                  ),
                ),

                const SizedBox(height: 18),

                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: inputDecoration(
                    label: 'Email',
                    hint: 'Nhập email',
                    prefixIcon: Icons.email_outlined,
                  ),
                ),

                const SizedBox(height: 18),

                TextField(
                  obscureText: hidePassword,
                  decoration: inputDecoration(
                    label: 'Password',
                    hint: 'Nhập mật khẩu',
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: IconButton(
                      icon: Icon(
                        hidePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: hintColor,
                      ),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
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
                          builder: (context) => const CongratulationsScreen(),
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
                      'Sign Up',
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
                    onPressed: () {},
                    child: const Text(
                      'Already have an account? Sign in',
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