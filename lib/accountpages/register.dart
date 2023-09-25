import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  bool _showPassword1 = false;
  void _togglevisibility1() {
    setState(() {
      _showPassword1 = !_showPassword1;
    });
  }

  bool _showPassword2 = false;
  void _togglevisibility2() {
    setState(() {
      _showPassword2 = !_showPassword2;
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register',
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
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.w),
                        ),
                        borderSide: const BorderSide(
                            color: Color(0xff3797C9), width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.w),
                        ),
                        borderSide: const BorderSide(
                            color: Color(0xff3797C9), width: 2.0),
                      ),
                      hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.3),
                          fontFamily: 'Raleway-Medium'),
                      hintText: 'tropical_sam',
                      labelText: 'Username',
                      labelStyle: TextStyle(
                          fontFamily: 'Raleway-Medium',
                          color: Colors.white.withOpacity(0.8)),
                      contentPadding: EdgeInsets.only(bottom: 0.0, left: 3.h)),
                  controller: _usernameController,
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
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.w),
                        ),
                        borderSide: const BorderSide(
                            color: Color(0xff3797C9), width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.w),
                        ),
                        borderSide: const BorderSide(
                            color: Color(0xff3797C9), width: 2.0),
                      ),
                      hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.3),
                          fontFamily: 'Raleway-Medium'),
                      hintText: 'tropical_sam',
                      labelText: 'Email',
                      labelStyle:
                          TextStyle(color: Colors.white.withOpacity(0.8)),
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
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _togglevisibility1();
                        },
                        child: Icon(
                          _showPassword1
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color.fromARGB(255, 171, 191, 255),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.w),
                        ),
                        borderSide: const BorderSide(
                            color: Color(0xff3797C9), width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.w),
                        ),
                        borderSide: const BorderSide(
                            color: Color(0xff3797C9), width: 2.0),
                      ),
                      hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.3),
                          fontFamily: 'Raleway-Medium'),
                      hintText: 'tropical_sam',
                      labelText: 'Password',
                      labelStyle:
                          TextStyle(color: Colors.white.withOpacity(0.8)),
                      contentPadding: EdgeInsets.only(bottom: 0.0, left: 3.h)),
                  controller: _passwordController,
                  obscureText: !_showPassword1,
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
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _togglevisibility2();
                        },
                        child: Icon(
                          _showPassword2
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color.fromARGB(255, 171, 191, 255),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.w),
                        ),
                        borderSide: const BorderSide(
                            color: Color(0xff3797C9), width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.w),
                        ),
                        borderSide: const BorderSide(
                            color: Color(0xff3797C9), width: 2.0),
                      ),
                      hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.3),
                          fontFamily: 'Raleway-Medium'),
                      hintText: 'tropical_sam',
                      labelText: 'Confirm Password',
                      labelStyle:
                          TextStyle(color: Colors.white.withOpacity(0.8)),
                      contentPadding: EdgeInsets.only(bottom: 0.0, left: 3.h)),
                  controller: _confirmpasswordController,
                  obscureText: !_showPassword2,
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
      ),
    );
  }
}
