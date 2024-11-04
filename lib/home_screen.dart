import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('NIM: 22SA1A999', style: TextStyle(fontSize: 18)),
          Text('Nama: Banu', style: TextStyle(fontSize: 18)),
          Text('Kelas: TI-1', style: TextStyle(fontSize: 18)),
          Text('Target Nilai: A', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
