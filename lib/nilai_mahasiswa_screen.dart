import 'package:flutter/material.dart';

class NilaiMahasiswaScreen extends StatefulWidget {
  final List<Map<String, dynamic>> studentData;

  NilaiMahasiswaScreen({required this.studentData});

  @override
  _NilaiMahasiswaScreenState createState() => _NilaiMahasiswaScreenState();
}

class _NilaiMahasiswaScreenState extends State<NilaiMahasiswaScreen> {
  bool _isDataVisible = false; // Track the visibility of the data

  String getLetterGrade(int totalScore) {
    if (totalScore >= 81) return 'A';
    if (totalScore >= 71) return 'B';
    if (totalScore >= 61) return 'C';
    if (totalScore >= 51) return 'D';
    return 'E';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Toggle the visibility of the data
              setState(() {
                _isDataVisible = !_isDataVisible;
              });
            },
            child: Text(_isDataVisible ? 'Sembunyikan Data' : 'Tampilkan Data'),
          ),
          SizedBox(height: 16),
          _isDataVisible
              ? Expanded(
                  child: ListView.builder(
                    itemCount: widget.studentData.length,
                    itemBuilder: (context, index) {
                      final student = widget.studentData[index];
                      final totalScore = student['teori'] + student['praktik'];
                      final letterGrade = getLetterGrade(totalScore);

                      return ListTile(
                        title: Text('NIM: ${student['nim']}'),
                        subtitle: Text(
                          'Nama: ${student['nama']}\n'
                          'Nilai Teori: ${student['teori']}\n'
                          'Nilai Praktik: ${student['praktik']}\n'
                          'Total Nilai: $totalScore\n'
                          'Nilai Huruf: $letterGrade',
                        ),
                      );
                    },
                  ),
                )
              : Container(), // Display an empty container when data is hidden
        ],
      ),
    );
  }
}
