import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'hasildaftar.dart';

class Formpage extends StatefulWidget {
  const Formpage({super.key});

  @override
  State<Formpage> createState() => _FormpageState();
}

class _FormpageState extends State<Formpage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nisController = TextEditingController();
  final TextEditingController waController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? kelas;
  String? gender; 
  List<String> eskulterpilih = [];

  final List<String> daftarkelas = [
    'X Rpl 1',
    'X Rpl 2',
    'X Dkv',
    'XI Rpl 1',
    'XI Rpl 2',
    'XI Dkv 1',
    'XI Dkv 2',
    'XII Rpl 1',
    'XII Rpl 2',
    'XII Dkv 1',
    'XII Dkv 2',
  ];

  final List<String> daftareskul = [
    'Futsal',
    'Rohis',
    'Basket',
    'Paskibra',
    'Robotik',
    'Taekwondo',
    'Rokris',
    'Tari',
    'Silat',
    'Pmr',
  ];

  void simpandata() {
    if (_formKey.currentState!.validate()) {
      
      if (gender == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Silakan pilih jenis kelamin')),
        );
        return;
      }

    
      if (eskulterpilih.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Pilih minimal satu ekstrakurikuler')),
        );
        return;
      }

      ResultPage.savedNama = namaController.text;
      ResultPage.savedNis = nisController.text;
      ResultPage.savedWa = waController.text;
      ResultPage.savedKelas = kelas!;
      ResultPage.savedGender = gender!;
      ResultPage.savedEskul = List.from(eskulterpilih);
      ResultPage.isTerdaftar = true;

     
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ResultPage(),
        ),
      );
    }
  }

  @override
  void dispose() {
    namaController.dispose();
    nisController.dispose();
    waController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pendaftaran",
          style: GoogleFonts.bebasNeue(fontSize: 30, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1D68A7),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF1D68A7)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/sm.png'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'SMK NEGERI 64',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Beranda utama'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.sports_soccer),
              title: const Text('Pendaftaran Ekstrakurikuler'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.assignment_turned_in),
              title: const Text('Hasil Pendaftaran'),
              onTap: () {
                Navigator.pop(context); // Menutup drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResultPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input Nama
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  hintText: 'Masukkan nama',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Input NIS
              TextFormField(
                controller: nisController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'NIS',
                  hintText: 'Masukkan NIS',
                  prefixIcon: Icon(Icons.badge),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'NIS wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Input No. WhatsApp
              TextFormField(
                controller: waController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'No. WhatsApp',
                  hintText: 'Masukkan nomor WA',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nomor WhatsApp wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Dropdown Kelas
              DropdownButtonFormField<String>(
                value: kelas,
                decoration: const InputDecoration(
                  labelText: 'Pilih Kelas',
                  prefixIcon: Icon(Icons.class_),
                  border: OutlineInputBorder(),
                ),
                items: daftarkelas.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    kelas = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Kelas wajib dipilih';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // BAGIAN JENIS KELAMIN
              Text(
                'Jenis Kelamin:',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Laki-laki'),
                      value: 'Laki-laki',
                      groupValue: gender,
                      contentPadding: EdgeInsets.zero,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Perempuan'),
                      value: 'Perempuan',
                      groupValue: gender,
                      contentPadding: EdgeInsets.zero,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Text(
                'Pilih Ekstrakurikuler:',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              Column(
                children: daftareskul.map((eskul) {
                  return CheckboxListTile(
                    title: Text(eskul),
                    value: eskulterpilih.contains(eskul),
                    contentPadding: EdgeInsets.zero,
                    onChanged: (bool? selected) {
                      setState(() {
                        if (selected == true) {
                          eskulterpilih.add(eskul);
                        } else {
                          eskulterpilih.remove(eskul);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D68A7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: simpandata,
                  child: Text(
                    'DAFTAR SEKARANG',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}