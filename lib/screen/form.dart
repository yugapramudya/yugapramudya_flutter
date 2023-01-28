import 'package:yuga_bebasuas/services.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class FormEdit extends StatelessWidget {
  const FormEdit({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)?.settings.arguments;
    print(data);
    TextEditingController judul = TextEditingController();
    TextEditingController penerbit = TextEditingController();
    TextEditingController edisi = TextEditingController();

    editData() async {
      var response = await Services().updateData(
        judul: judul.text,
        penerbit: penerbit.text,
        edisi: edisi.text,
        token: data['token'],
        id: data['data']['id'].toString(),
      );
      print(response);
    }

    Widget form({icon, controller, hint, initial}) {
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Edit Data'),
            form(
                icon: Icons.book_outlined,
                hint: '${data['data']['judul']}',
                controller: judul,
                initial: data['judul']),
            form(
              icon: Icons.bookmark,
              hint: '${data['data']['penerbit_id']}',
              controller: penerbit,
            ),
            form(
              icon: Icons.edit_outlined,
              hint: '${data['data']['edisi_ke']}',
              controller: edisi,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  editData();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.upload),
                label: const Text('Update'))
          ],
        ),
      ),
    );
  }
}
