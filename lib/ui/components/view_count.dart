import 'package:flutter/material.dart';
import 'package:orai/provider/count_provider.dart';
import 'package:provider/provider.dart';

class ViewCountWidget extends StatelessWidget {
  const ViewCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // Consumer를 통해 CountProvider의 count를 가져옴
      child: Consumer<CountProvider>(
        builder: (context, provider, child) {
          return Text(
            provider.count.toString(), // count를 화면에 출력
            style: const TextStyle(fontSize: 40.0),
          );
        },
      ),
    );
  }
}
