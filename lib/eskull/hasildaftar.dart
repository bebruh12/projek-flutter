import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatelessWidget {
  
  static String savedNama = "Belum ada pendaftaran";
  static String savedNis = "-";
  static String savedWa = "-";
  static String savedKelas = "-";
  static String savedGender = "-";
  static List<String> savedEskul = [];
  static bool isTerdaftar = false;

  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hasil Pendaftaran",
          style: GoogleFonts.bebasNeue(fontSize: 28, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1D68A7),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    isTerdaftar ? "Bukti Pendaftaran" : "Status Pendaftaran",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1D68A7),
                    ),
                  ),
                ),
                const Divider(height: 30, thickness: 1),
              
                _buildDataRow("Nama Lengkap", savedNama),
                _buildDataRow("NIS", savedNis),
                _buildDataRow("No. WhatsApp", savedWa),
                _buildDataRow("Kelas", savedKelas),
                _buildDataRow("Jenis Kelamin", savedGender),
                _buildDataRow("Eskul Terpilih", savedEskul.join(', ')),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1D68A7),
                    ),
                    onPressed: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    child: Text(
                      "Kembali ke Beranda",
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
          ),
          const Text(": "),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}