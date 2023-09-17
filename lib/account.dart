import 'package:eclipse_ecommerce_app/accountpages/login.dart';
import 'package:eclipse_ecommerce_app/accountpages/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 10.h,
              width: 80.w,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(
                        Color.fromARGB(255, 86, 123, 243)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.w)),
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => const LoginPage());
                  },
                  child: const Text("Login"))),
          Container(
            height: 5.h,
          ),
          SizedBox(
              height: 10.h,
              width: 80.w,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(
                        Color.fromARGB(255, 86, 123, 243)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.w)),
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => const RegisterPage());
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(fontFamily: 'Raleway-SemiBold'),
                  )))
        ],
      ),
    );
  }
}
