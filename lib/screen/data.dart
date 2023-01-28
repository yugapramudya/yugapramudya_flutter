import 'dart:developer';

import 'package:yuga_bebasuas/services.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  List<dynamic> data = [];
  @override
  Widget build(BuildContext context) {
    final token = ModalRoute.of(context)?.settings.arguments;
    getData() async {
      var response = await Services().getData(token: token.toString());
      setState(() {
        data = response['data']['data'];
      });
      print(response['data']['data']);
    }

    deleteData(id) async {
      var response = await Services().delete(token: token.toString(), id: id);
      setState(() {
        getData();
      });
      print(response);
    }

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text('Data'),
        centerTitle: true,
        backgroundColor: secondary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: secondary),
                onPressed: getData,
                child: Icon(
                  Icons.download,
                  color: white,
                ),
              ),
            ),
            Column(
              children: data
                  .map(
                    (e) => Row(
                      children: [
                        Container(
                          width: 332,
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            color: white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: secondary,
                                spreadRadius: 2,
                                blurRadius: 10.0,
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Nama Buku : ${e['judul']}'),
                                  const SizedBox(height: 10),
                                  Text('Edisi Ke : ${e['edisi_ke']}'),
                                  const SizedBox(height: 10),
                                  Text('Penerbit : ${e['penerbit_id']}'),
                                  const SizedBox(height: 10),
                                ],
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green),
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/form',
                                    arguments: {
                                      'data': e,
                                      'token': token.toString()
                                    },
                                  );
                                },
                                child: const Icon(Icons.edit),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                                onPressed: () {
                                  deleteData(e['id'].toString());
                                },
                                child: const Icon(Icons.delete),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
