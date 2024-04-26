// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:orai/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountHomeWidget extends StatelessWidget {
  CountHomeWidget({super.key});

  late CountProvider countProvider;

  @override
  Widget build(BuildContext context) {
    countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Count Provider"),
      ),
      body: Container(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              countProvider.increment(); // 클릭 되었을 때 increment() 이벤트 처리
            },
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              countProvider.decrement(); // 클릭 되었을 때 decrement() 이벤트 처리
            },
          )
        ],
      ),
    );
  }
}
