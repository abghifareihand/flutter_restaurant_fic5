import 'package:flutter/material.dart';
import 'package:flutter_restaurant_fic5/presentation/pages/register_page.dart';
import 'package:go_router/go_router.dart';
import '../widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  bool isHide = true;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController!.dispose();
    _passwordController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 100,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login User',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  /// Email
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),

                  /// Password
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: TextFormField(
                      obscureText: isHide,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isHide = !isHide;
                            });
                          },
                          icon: Icon(
                            isHide
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),

                  /// Button Login
                  CustomButton(
                    onPressed: () {},
                    buttonText: 'Login',
                    buttonWidth: double.infinity,
                  ),

                  /// Don't Account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                      ),
                      TextButton(
                        onPressed: () => context.push(RegisterPage.routeName),
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
