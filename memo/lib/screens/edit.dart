import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                // obscureText: true,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  // border: OutlineInputBorder(),
                  labelText: '메모의 제목을 적어주세요',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              TextField(
                // obscureText: true,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  // border: OutlineInputBorder(),
                  hintText: '메모의 내용을 적어주세요',
                ),
              )
            ],
          ),
        ));
  }
}
