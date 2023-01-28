import 'package:yuga_bebasuas/screen/awal.dart';
import 'package:yuga_bebasuas/screen/data.dart';
import 'package:yuga_bebasuas/screen/form.dart';
import 'package:yuga_bebasuas/screen/login.dart';
import 'package:yuga_bebasuas/screen/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Login(),
        '/register': (context) => const Register(),
        '/awal': (context) => const Awal(),
        '/data': (context) => const Data(),
        '/form': (context) => const FormEdit(),
      },
    );
  }
}
