import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'signUp_Screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppLogo(
                width: 160,
                height: 167,
                margin: EdgeInsets.symmetric(vertical: 20),
              ),
              SizedBox(height: 50),
              MultiContentBoxWidget(
                children: [
                  MainButton(
                    onPressed: () {},
                    width: 180,
                    child: Text("تسجيل دخول كمشتري"),
                  ),
                  MainButton(
                    onPressed: () {},
                    width: 180,
                    child: Text("تسجيل دخول كبائع"),
                  ),
                  Text("ليس لديك حساب ؟", style: TextStyle(fontSize: 16)),
                  MainButton(
                    width: 130,
                    height: 40,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text("الأشتراك", style: TextStyle(fontSize: 12)),

                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
