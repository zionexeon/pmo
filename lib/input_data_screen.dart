import 'package:flutter/material.dart';

class InputDataScreen extends StatefulWidget {
  final Function(Map<String, dynamic>) onSaveData;

  InputDataScreen({required this.onSaveData});

  @override
  _InputDataScreenState createState() => _InputDataScreenState();
}

class _InputDataScreenState extends State<InputDataScreen> {
  final _nimController = TextEditingController();
  final _namaController = TextEditingController();
  final _teoriController = TextEditingController();
  final _praktikController = TextEditingController();

  void _saveData() {
    final newStudent = {
      'nim': _nimController.text,
      'nama': _namaController.text,
      'teori': int.parse(_teoriController.text),
      'praktik': int.parse(_praktikController.text),
    };
    widget.onSaveData(newStudent);
    // Clear input fields after saving
    _nimController.clear();
    _namaController.clear();
    _teoriController.clear();
    _praktikController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
            border: Border.all(color: Colors.purple, width: 1.5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Input Data Mahasiswa',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _nimController,
                decoration: InputDecoration(
                  labelText: 'Nomor Induk Mahasiswa',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: 'Nama Mahasiswa',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _teoriController,
                decoration: InputDecoration(
                  labelText: 'Nilai Teori',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _praktikController,
                decoration: InputDecoration(
                  labelText: 'Nilai Praktik',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: _saveData, child: Text('Simpan')),
                  ElevatedButton(
                    onPressed: () {
                      _nimController.clear();
                      _namaController.clear();
                      _teoriController.clear();
                      _praktikController.clear();
                    },
                    child: Text('Batal'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
