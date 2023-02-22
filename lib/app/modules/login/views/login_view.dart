import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:Coruja_billiard/app/data/controller/auth_controller.dart';
import 'package:Coruja_billiard/app/routes/app_pages.dart';

import '../../cart/controllers/cart_controller.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final authC = Get.find<AuthController>();
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 800,
            padding: EdgeInsets.all(20),
            color: Colors.black,
            child: SafeArea(
                child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Image.asset(
                    'assets/gambar/logo_1.png',
                    scale: 0.7,
                  ),
                ),

                // textfild
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    _formFields(context),
                    const SizedBox(height: 16),

                    _signinButton(),
                    const SizedBox(height: 16),
                    _divider(),
                    _LoginGoogle(),
                    // _divider(),
                    // _Register(),
                    // _socialLogins(),
                    // const SizedBox(height: 16),
                    // _signupButton(context),
                  ],
                ),
              ],
            )),
          ),
        ));
  }

  Widget _formFields(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onChanged: (value) {
            email = value;
          },
          showCursor: false,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            hintText: 'Email',
            hintStyle: TextStyle(color: Colors.grey.shade600),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: Color.fromARGB(255, 164, 164, 164),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 164, 164, 164), width: 2.0),
              borderRadius: BorderRadius.circular(12),
            ),
            fillColor: Colors.grey[900],
            filled: true,
            contentPadding: const EdgeInsets.all(19),
          ),
          style: TextStyle(color: Colors.grey[50], fontSize: 17),
        ),
        const SizedBox(height: 22),
        TextFormField(
          onChanged: (value) {
            password = value;
          },
          showCursor: false,
          obscureText: true,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            hintText: 'password',
            hintStyle: TextStyle(color: Colors.grey.shade600),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 164, 164, 164),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            fillColor: Colors.grey[900],
            filled: true,
            contentPadding: const EdgeInsets.all(19),
          ),
          style: TextStyle(color: Colors.grey[50], fontSize: 17),
        ),
        SizedBox(
          height: 20,
        )
        // Container(
        //   padding: const EdgeInsets.symmetric(vertical: 10),
        //   alignment: Alignment.centerLeft,
        //   child: InkWell(
        //     onTap: () {},
        //     child: Text(
        //       'Forgot Password',
        //       style: TextStyle(
        //         fontWeight: FontWeight.bold,
        //         color: Color.fromARGB(255, 182, 182, 182),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget _Register() {
    return Row(children: [
      Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.center,
              stops: const [0.0, 1.0],
              colors: [
                Color(0xffEDE88A),
                Color.fromARGB(255, 143, 161, 52),
              ],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.transparent,
                ),
              ),
              onPressed: () {},
              child: const Text('REGISTER',
                  style: TextStyle(color: Colors.white, fontSize: 16))),
        ),
      ),
    ]);
  }

  Widget _signinButton() {
    return Row(children: [
      Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.center,
              stops: const [0.0, 1.0],
              colors: [
                Color.fromARGB(255, 233, 223, 37),
                Color.fromARGB(255, 143, 161, 52),
              ],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.transparent,
                ),
              ),
              onPressed: () async {
                final user = await _auth.signInWithEmailAndPassword(
                    email: email, password: password);
                if (user != null) {
                  // print(email);
                  Get.offAllNamed(Routes.PREVENT_HOME_ADMIN);
                }
              },
              child: const Text(
                'LOGIN',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold),
              )),
        ),
      ),
    ]);
  }

  Widget _LoginGoogle() {
    return Row(children: [
      Expanded(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.center,
                stops: const [0.0, 1.0],
                colors: [
                  Color(0xffEDE88A),
                  Color.fromARGB(255, 143, 161, 52),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.transparent,
                ),
              ),
              onPressed: () {
                authC.signInWithGoogle();
              },
              child: Center(
                child: const Text('Sign In with Google',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold)),
              ),
            )),
      ),
    ]);
  }

  _divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: <Widget>[
          const SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey.shade500,
              ),
            ),
          ),
          Text(
            'or Login',
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 15,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey.shade500,
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  _socialLogins() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              border: Border.all(color: Colors.grey.shade800),
              borderRadius: const BorderRadius.all(Radius.circular(
                      12.0) //                 <--- border radius here
                  ),
            ),
            child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(
                  Icons.g_mobiledata,
                  size: 40,
                  color: Colors.white,
                )),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              border: Border.all(color: Colors.grey.shade800),
              borderRadius: const BorderRadius.all(Radius.circular(
                      12.0) //                 <--- border radius here
                  ),
            ),
            child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(
                  Icons.apple,
                  size: 30,
                  color: Colors.white,
                )),
          ),
        ),
      ],
    );
  }

  Widget _signupButton(BuildContext context) {
    return InkWell(
      onTap: (() {}),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Dont have an account?',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(width: 5),
          const Text(
            'Sign up',
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
