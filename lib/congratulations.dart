import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF2F54FF);
const Color titleColor = Color(0xFF1E293B);
const Color hintColor = Color(0xFF64748B);

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({super.key});

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
                backButton(context),

                const SizedBox(height: 50),

                Center(
                  child: Image.asset(
                    'assets/images/hinh_sv.JPG',
                    height: 220,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.check_circle_rounded,
                        color: primaryColor,
                        size: 180,
                      );
                    },
                  ),
                ),

                const SizedBox(height: 40),

                const Center(
                  child: Text(
                    'Congratulations!',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: titleColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 18),

                const Center(
                  child: Text(
                    'Your account has been created successfully. We have sent a verification email to your email address.',
                    style: TextStyle(
                      fontSize: 16,
                      color: hintColor,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 20),

                const Center(
                  child: Text(
                    'Thank you for signing up with us!',
                    style: TextStyle(
                      fontSize: 16,
                      color: titleColor,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const Spacer(),

                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign in here',
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