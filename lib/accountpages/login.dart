import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xff3797C9),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Color(0xff222222)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Raleway-Regular',
                  fontSize: 18.sp),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
              child: TextFormField(
                cursorOpacityAnimates: true,
                cursorWidth: 1.0,
                cursorColor: Colors.white.withOpacity(0.5),
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontFamily: 'Raleway-Medium'),
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide:
                          BorderSide(color: Color(0xff3797C9), width: 2.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide:
                          BorderSide(color: Color(0xff3797C9), width: 2.0),
                    ),
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.3),
                        fontFamily: 'Raleway-Medium'),
                    hintText: 'tropicalsam@gmail.com',
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
                    contentPadding: EdgeInsets.only(bottom: 0.0, left: 3.h)),
                controller: _emailController,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
              child: TextFormField(
                cursorOpacityAnimates: true,
                cursorWidth: 1.0,
                cursorColor: Colors.white.withOpacity(0.5),
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontFamily: 'Raleway-Medium'),
                obscureText: !_showPassword,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _togglevisibility();
                      },
                      child: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                        color: const Color(0xff3797C9),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide:
                          BorderSide(color: Color(0xff3797C9), width: 2.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide:
                          BorderSide(color: Color(0xff3797C9), width: 2.0),
                    ),
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.3),
                        fontFamily: 'Raleway-Medium'),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
                    contentPadding: EdgeInsets.only(bottom: 0.0, left: 3.h)),
                controller: _passwordController,
              ),
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                  Color(0xff3797C9),
                )),
                onPressed: () {},
                child: const Text(
                  'Submit',
                  style: TextStyle(fontFamily: 'Raleway-SemiBold'),
                )),
          ],
        ),
      ),
    );
  }
}
