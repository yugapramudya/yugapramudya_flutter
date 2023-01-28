import 'package:yuga_bebasuas/services.dart';
import 'package:flutter/material.dart';
import '../theme.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController name = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController secondPassword = TextEditingController();

    register() async {
      var response = await Services().register(
        name: name.text,
        email: email.text,
        password: password.text,
        secondPassword: secondPassword.text,
      );

      if (response == 403) {
      } else if (response['success'].toString() == 'true') {
        setState(() {
          Navigator.pushNamed(context, '/awal', arguments: response);
        });
      }
      print(response);
    }

    Widget formNama() {
      return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: white,
        ),
        child: TextFormField(
          controller: name,
          decoration: InputDecoration(
            hintText: 'Nama',
            icon: Icon(
              Icons.person_outline,
              color: secondary,
            ),
          ),
        ),
      );
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
          obscureText: true,
          controller: password,
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

    Widget formSecondPassword() {
      return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: white,
        ),
        child: TextFormField(
          obscureText: true,
          controller: secondPassword,
          decoration: InputDecoration(
            hintText: 'Masukkan Kembali Password',
            icon: Icon(
              Icons.lock_open_outlined,
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
        onPressed: register,
        child: Text(
          'Register',
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
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 30),
                  formNama(),
                  const SizedBox(height: 20),
                  formEmail(),
                  const SizedBox(height: 20),
                  formPassword(),
                  const SizedBox(height: 20),
                  formSecondPassword(),
                  const SizedBox(height: 40),
                  buttonLogin(),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: const Text('Login Disini'),
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
