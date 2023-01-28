import 'package:yuga_bebasuas/services.dart';
import 'package:yuga_bebasuas/theme.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();

    login() async {
      var response =
          await Services().login(email: email.text, password: password.text);
      if (response == 403) {
      } else if (response['success'].toString() == 'true') {
        setState(() {
          Navigator.pushNamed(context, '/awal', arguments: response);
        });
      }
      print(response);
    }

    Widget formEmail() {
      return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: white,
        ),
        child: TextFormField(
          controller: email,
          decoration: InputDecoration(
            hintText: 'Email',
            icon: Icon(
              Icons.email_outlined,
              color: secondary,
            ),
          ),
        ),
      );
    }

    Widget formPassword() {
      return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: white,
        ),
        child: TextFormField(
          controller: password,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            icon: Icon(
              Icons.lock_open,
              color: secondary,
            ),
          ),
        ),
      );
    }

    Widget buttonLogin() {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: secondary,
        ),
        onPressed: login,
        child: Text(
          'Login',
          style: TextStyle(
              color: white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            decoration: BoxDecoration(
              color: primary,
              border: Border.all(
                color: secondary,
                width: 4,
                style: BorderStyle.solid,
              ),
              boxShadow: [
                BoxShadow(
                  color: primary,
                  offset: const Offset(
                    1.0,
                    1.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  const Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 30),
                  formEmail(),
                  const SizedBox(height: 30),
                  formPassword(),
                  const SizedBox(height: 100),
                  buttonLogin(),
                  const SizedBox(height: 100),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
