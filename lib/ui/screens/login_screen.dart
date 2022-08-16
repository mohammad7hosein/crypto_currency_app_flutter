import 'package:cripto_currency_app_flutter/constants/my_theme.dart';
import 'package:cripto_currency_app_flutter/ui/components/my_snackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: purpleDark,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: purpleDark,
              height: height * 0.3,
              child: SvgPicture.asset("assets/images/mobile_login_2.svg"),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.07, vertical: height * 0.02),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              /* TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "Username",
                                  prefixIcon: Icon(Icons.person_rounded),
                                ),
                                controller: nameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter username';
                                  } else if (value.length < 4) {
                                    return 'at least enter 4 characters';
                                  } else if (value.length > 13) {
                                    return 'maximum character is 13';
                                  }
                                  return null;
                                },
                              ),
                              Divider(
                                height: height * 0.02,
                              ),*/
                              TextFormField(
                                style: Theme.of(context).textTheme.bodySmall,
                                decoration: const InputDecoration(
                                  hintText: "Email",
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: purple,
                                  ),
                                ),
                                controller: emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter gmail';
                                  } else if (!value.endsWith('@gmail.com')) {
                                    return 'please enter valid gmail';
                                  }
                                  return null;
                                },
                              ),
                              Divider(
                                height: height * 0.02,
                              ),
                              TextFormField(
                                style: Theme.of(context).textTheme.bodySmall,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: "Password",
                                  prefixIcon: Icon(
                                    Icons.lock_outline_rounded,
                                    color: purple,
                                  ),
                                ),
                                controller: passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  } else if (value.length < 7) {
                                    return 'at least enter 6 characters';
                                  } else if (value.length > 13) {
                                    return 'maximum character is 13';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: GoogleFonts.ubuntu(
                              color: purpleDark,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.4,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).focusColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  signIn();
                                }
                              },
                              child: Text(
                                "Login",
                                style: GoogleFonts.ubuntu(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/facebook.svg",
                              width: 24,
                              height: 24,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/google.svg",
                              width: 24,
                              height: 24,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/apple.svg",
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: Colors.white,
          size: 50,
        ),
      ),
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.message == null) return;
      ScaffoldMessenger.of(context).showSnackBar(buildSnackBar(context, e.message!));
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
