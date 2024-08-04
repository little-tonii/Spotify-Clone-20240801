import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_vecctors.dart';
import 'package:spotify_clone/data/datasources/root/pages/root.dart';
import 'package:spotify_clone/data/models/auth/signin_user_req.dart';
import 'package:spotify_clone/domain/usecases/auth/signin.dart';
import 'package:spotify_clone/presentation/auth/pages/signup.dart';
import 'package:spotify_clone/service_locator.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Not A Memeber?',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            TextButton(
              style: const ButtonStyle(
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => SignupPage(),
                  ),
                );
              },
              child: const Text(
                'Register Now',
                style: TextStyle(
                    color: Color(0xFF288CE9), fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Sign In',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 48,
            ),
            TextField(
              controller: _email,
              decoration: const InputDecoration(
                hintText: 'Enter Email',
              ).applyDefaults(
                Theme.of(context).inputDecorationTheme,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _password,
              decoration: const InputDecoration(
                hintText: 'Password',
              ).applyDefaults(
                Theme.of(context).inputDecorationTheme,
              ),
            ),
            const SizedBox(height: 20),
            BasicAppButton(
                onPressed: () async {
                  final result = await sl<SigninUsecase>().call(
                    params: SigninUserReq(
                      email: _email.text.toString(),
                      password: _password.text.toString(),
                    ),
                  );

                  result.fold(
                    (left) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(left),
                        ),
                      );
                    },
                    (right) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const RootPage(),
                        ),
                        (route) => false,
                      );
                    },
                  );
                },
                title: 'Sign In'),
          ],
        ),
      ),
    );
  }
}
