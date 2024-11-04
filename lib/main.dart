import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'nilai_mahasiswa_screen.dart';
import 'input_data_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Shared list of data
  List<Map<String, dynamic>> studentData = [
    {'nim': '22SA11A901', 'nama': 'Banu', 'teori': 80, 'praktik': 80},
    {'nim': '22SA11A902', 'nama': 'Dwi', 'teori': 20, 'praktik': 30},
    {'nim': '22SA11A903', 'nama': 'Puranto', 'teori': 80, 'praktik': 90},
  ];

  int _currentIndex = 0;

  // Method to add data
  void addStudentData(Map<String, dynamic> newStudent) {
    setState(() {
      studentData.add(newStudent);
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Data has been saved successfully!'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomeScreen(),
      NilaiMahasiswaScreen(studentData: studentData),
      InputDataScreen(onSaveData: addStudentData),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
        appBar: AppBar(title: const Text('Kuis 1 Nama - NIM')),
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Nilai Mahasiswa',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Input Data',
            ),
          ],
        ),
      ),
    );
  }
}
