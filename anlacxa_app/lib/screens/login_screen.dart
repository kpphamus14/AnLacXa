import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;
  Icon passwordIcon = const Icon(Icons.visibility_off);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void togglePassword() {
    setState(
      () {
        isPasswordVisible = !isPasswordVisible;
        if (isPasswordVisible) {
          passwordIcon = const Icon(Icons.visibility);
        } else {
          passwordIcon = const Icon(Icons.visibility_off);
        }
      },
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  InputDecoration _buildInputDecoration(String hintText) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.green.shade100,
      hintText: hintText,
      contentPadding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green.shade100),
        borderRadius: BorderRadius.circular(15),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green.shade100),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image(
                      image: AssetImage('assets/images/1.png'),
                      fit: BoxFit.cover)),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        20, 10, 20, MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.green.shade500,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Some Text Here',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        TextField(
                          scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          controller: _usernameController,
                          autofocus: false,
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(fontSize: 18),
                          decoration: _buildInputDecoration('Username'),
                        ),
                        const SizedBox(height: 30),
                        TextField(
                          scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          controller: _passwordController,
                          textInputAction: TextInputAction.done,
                          autofocus: false,
                          obscureText: !isPasswordVisible,
                          style: const TextStyle(fontSize: 18),
                          decoration:
                              _buildInputDecoration('Password').copyWith(
                            suffixIcon: IconButton(
                              onPressed: togglePassword,
                              icon: passwordIcon,
                            ),
                          ),
                        ),
                        const SizedBox(height: 60),
                        ElevatedButton(
                          onPressed: () {
                            print(_usernameController);
                            print(_passwordController);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade500,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            minimumSize: const Size(double.infinity, 40),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
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
