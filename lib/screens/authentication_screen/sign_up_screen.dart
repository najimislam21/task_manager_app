import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/model/api_response.dart';
import 'package:task_manager/data/service/api_caller.dart';
import 'package:task_manager/screens/authentication_screen/login_screen.dart';
import 'package:task_manager/utils/app_colors.dart';
import 'package:task_manager/utils/urls.dart';
import 'package:task_manager/widget/screen_bg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  void onTapSignIn() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

  }


  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  // All Controller
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  Future<void> signUp() async {

    final ApiResponse response = await ApiCaller.PostRequest(url: TMUrls.SingUpUrls,
    body: {
      "email":emailController.text,
      "firstName":firstNameController.text,
      "lastName":lastNameController.text,
      "mobile":mobileController.text,
      "password":passwordController.text,
    }
    );
    if(response.isSuccess){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Singe up success...//'),));
    } else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.responseDate['data']),));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key:  formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 170),
                Text('Join With Us ', style: Theme.of(context).textTheme.titleLarge,),
                SizedBox(height: 26),
                TextFormField(
                  controller: emailController,
                    decoration: InputDecoration(hintText: 'Email'),
                  validator: (value){
                    if(value==null ||value.trim().isEmpty){
                      return 'Please Enter Email';
                    }if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value.trim())) {
                      return 'Please enter a valid email';
                    }else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: firstNameController,
                    decoration: InputDecoration(hintText: 'First Name'),
                  validator: (value){
                    if(value == null || value.trim().isEmpty){
                      return 'Please enter first name';
                    }
                    if(value.trim().length<3){
                      return 'Minimum 3 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: lastNameController,
                    decoration: InputDecoration(hintText: 'Last Name'),
                  validator: (value){
                    if(value == null || value.trim().isEmpty){
                      return 'Please enter last name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: mobileController,
                    decoration: InputDecoration(hintText: 'Mobile'),
                  validator: (value){
                    if(value == null || value.trim().isEmpty){
                      return 'please enter mobile number';
                    }
                    else if(!RegExp(r'^01[3-9]\d{8}$').hasMatch(value.trim())){
                      return 'Invalid mobile number';
                    }
                    else if(value.length != 11){
                      return 'Please enter correct mobile number';
                    }else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: passwordController,
                    decoration: InputDecoration(hintText: 'Password'),
                  validator: (value){
                    if(value==null || value.trim().isEmpty){
                      return 'Please enter password';
                    }else if(value.length<8){
                      return 'Minimum 8 characters';
                    }else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),

                FilledButton(
                  onPressed: () {
                    if(formkey.currentState!.validate()){
                      signUp();
                    }
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
      ),
    );
  }
}

