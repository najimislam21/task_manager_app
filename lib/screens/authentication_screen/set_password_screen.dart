import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/screens/authentication_screen/login_screen.dart';
import 'package:task_manager/screens/authentication_screen/pin_verification_screen.dart';
import 'package:task_manager/utils/app_colors.dart';
import 'package:task_manager/widget/screen_bg.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {

  void onTapSignIn() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 200),
              Text(
                'Set Password',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 10,),
              Text('Minimum length password 8 character with Letter and number combination',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey)),

              SizedBox(height: 26),
              TextFormField(decoration: InputDecoration(hintText: 'Password')),
              SizedBox(height: 12),
              TextFormField(decoration: InputDecoration(hintText: 'Confirm Password')),
              SizedBox(height: 20),

              FilledButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PinVerificationScreen()));
                },
                child: Icon(Icons.arrow_circle_right_outlined, size: 25,),
              ),
              SizedBox(height: 35),

              Center(
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Have account?",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign In,',
                            style: TextStyle(
                              color: AppColors.PColor,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = onTapSignIn,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

