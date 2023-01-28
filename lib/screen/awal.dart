import 'dart:developer';

import 'package:yuga_bebasuas/services.dart';
import 'package:yuga_bebasuas/theme.dart';
import 'package:flutter/material.dart';

class Awal extends StatefulWidget {
  const Awal({super.key});

  @override
  State<Awal> createState() => _AwalState();
}

class _AwalState extends State<Awal> {
  bool form = false;
  @override
  Widget build(BuildContext context) {
    dynamic user = ModalRoute.of(context)?.settings.arguments;
    TextEditingController judul = TextEditingController();
    TextEditingController penerbit = TextEditingController();
    TextEditingController edisi = TextEditingController();

    addForm({hint, icon, controller}) {
      return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: white,
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            icon: Icon(
              icon,
              color: secondary,
            ),
          ),
        ),
      );
    }

    addData() async {
      var response = await Services().addData(
        judul: judul.text,
        penerbit: penerbit.text,
        edisi: edisi.text,
        token: user['token'],
      );
      print(response);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      appBar: AppBar(
        title: Column(
          children: [
            Text('Selamat Datang ${user['data']['name']}'),
            Text('${user['data']['email']}')
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: secondary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            form
                ? Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        addForm(
                            icon: Icons.book_outlined,
                            hint: 'Judul Buku',
                            controller: judul),
                        const SizedBox(height: 15),
                        addForm(
                            icon: Icons.bookmark,
                            hint: 'Penerbit',
                            controller: penerbit),
                        const SizedBox(height: 15),
                        addForm(
                            icon: Icons.edit_outlined,
                            hint: 'Edisi Ke',
                            controller: edisi),
                      ],
                    ),
                  )
                : const SizedBox(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: white),
              onPressed: () {
                Navigator.pushNamed(context, '/data', arguments: user['token']);
              },
              child: Text(
                'Lihat Data',
                style: TextStyle(
                  color: secondary,
                  fontSize: 30,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: white),
              onPressed: () {
                setState(() {
                  if (form) {
                    addData();
                    form = !form;
                  } else {
                    form = !form;
                  }
                });
              },
              child: Text(
                'Tambah Data',
                style: TextStyle(
                  color: secondary,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
