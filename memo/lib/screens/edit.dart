import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memo/database/db.dart';
import 'package:memo/database/memo.dart';

class EditPage extends StatelessWidget {
  String title = '';
  String text = '';
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
              onPressed: saveDB,
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: (String title) {
                  this.title = title;
                },
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
                onChanged: (String text) {
                  this.text = text;
                },
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

  Future<void> saveDB() async {
    DBHelper sd = DBHelper();

    var fido = Memo(
        id: 2,
        title: this.title,
        text: this.text,
        createTime: DateTime.now().toString(),
        editTime: DateTime.now().toString());

    await sd.insertMemo(fido);

    print(await sd.memos());
  }
}
