import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/custom_button.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController? _usernameController;
  TextEditingController? _nameController;
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  bool isHide = true;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController!.dispose();
    _nameController!.dispose();
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
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Register User',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  /// Username
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Username',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),

                  /// Name
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: TextFormField(
                      controller: _nameController,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Name',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
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

                  /// Button Register
                  CustomButton(
                    onPressed: () {},
                    buttonText: 'Register',
                    buttonWidth: double.infinity,
                  ),

                  /// Already Account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                      ),
                      TextButton(
                        onPressed: () => context.pop(),
                        child: const Text(
                          'Login',
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
