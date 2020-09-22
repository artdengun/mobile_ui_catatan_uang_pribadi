import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Catatan Uang Pribadi"),
        ),
        body: Container(
          //MENGGUNAKAN COLUMN KARENA ADA DUA OBJEK YANG INGIN DIPISAHKAN
          //PERTAMA ADALAH HEADER BESERTA SUMMARYNYA DAN YANG KEDUA ADALAH HISTORY
          child: Column(
            children: <Widget>[
              // kita unakan stack untuk mengatur position heaaer serta container
              Stack(
                children: <Widget>[backgroundHeader(), summaryCash()],
              ),
              // BAGIAN  INI MENAMPILKAN HISTORY PENGELUARAN
              cardDetail(
                  'Makan Siang', 'Beli Makan di Warteg', '100.000', 'out'),
              cardDetail('Bonus', 'Dpat Bonus Proyek', '200.000', 'in'),
              cardDetail('Beli Baju', 'Baju kemeja kantor', '250.000', 'out'),
            ],
          ),
        ),
      ),
    );
  }
}

Widget cardDetail(title, description, price, type) {
  // container untuk history pengeluaran
  //BUAT CARD
  return Card(
    //DENGAN MARGIN YANG DISESUAIKAN
    margin: EdgeInsets.only(top: 15, left: 15, right: 15),
    //DENGAN KETEBALAN AGAR MEMBENTUK SHADOW SENILAI 8
    elevation: 8,
    //CHILD DARI CARD MENGGUNAKAN LISTTILE AGAR LEBIH MUDAH MENGATUR AREANYA
    //KARENA SECARA DEFAULT LISTTILE TELAH TERBAGI MENJADI 3 BAGIAN
    //POSISI KIRI (LEADING), TENGAH (TITLE), BAWAH TENGAH (SUBTITLE) DAN KANAN(TRAILING)
    //SEHINGGA KITA HANYA TINGGAL MEMASUKKAN TEKS YANG SESUAI
    child: ListTile(
      leading: Icon(
        type == 'out' ? Icons.subdirectory_arrow_left:Icons.subdirectory_arrow_right,
        color: type == 'out' ? Colors.redAccent:Colors.lightGreen,
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(description),
      trailing: Text(
        "Rp "+price,
        style: TextStyle(color: type == 'out' ? Colors.redAccent:Colors.lightGreen),
      ),
    ),
  );
}
Widget summaryCash() {
  // container untuk summary pengeluaran dan pemasukan
  //CONTAINER KEDUA INI BERWARNA PUTIH, KITA SET POSITIONEDNYA DENGAN MENENTUKAN VALUE DARI TOP DAN LEFT AGAR BERADA DITENGAH, DISESUAIKAN SAJA
  return Positioned(
    top: 180,
    left: 20,
    //CONTAINER KEDUA INI KITA BUAT LEBIH KECIL DENGAN MENENTUKAN WIDTH DAN HEIGHNYA TERBATAS
    child: Container(
      width: 370,
      height: 140,
      //SAMA HALNYA DENGAN CONTAINER SEBELUMNYA, WARNANYA DI-SET DAN BORDERRADIUSNYA KALI INI BERBEDA KITA SET KE-4 SISINYA AGAR MELENGKUNG
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      //CHILD DARI CONTAINER INI DI-SET PADDINGNYA AGAR TERDAPAT JARAK DARI ATAS
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        //KARENA ADA DUA BAGIAN YANG BERBARIS DARI KIRI KE KANAN MAKA KITA GUNAKAN ROW()
        child: Row(
          //MAIN ALIGMENTNYA DI-SET SPACEAROUND AGAR KEDUA OBJEKNYA ADA JARAK YANG SESUAI
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //MASING-MASING OBJECT MENGGUNAKAN COLUMN LAGI ADA DUA BUAH TEKS YANG INGIN DITAMPILKAN SECARA VERTICAL
            Column(
              children: <Widget>[
                Text("Penghasilan"),
                Divider(),
                Text(
                  "Rp 500.000",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text("Pengeluaran"),
                Divider(),
                Text(
                  "Rp 260.000",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
Widget backgroundHeader() {
  // container untuk header
  //KITA BUAT CONTAINER DENGAN TINGGI SEBESAR 300, DAN LEBAR SEJAUH YANG BISA DIJANGKAU
  //BOXDECORATIONNYA KITA SET WARNANYA PINKACCENT DAN PADA BAGIAN BAWAH KIRI-KANAN DIBUAT LENGKUNGAN

  return Container(
    height: 300,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.pinkAccent,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
    ),
    //ADAPUN CHILD DARI CONTAINER DIATAS KITA ATUR POSISINYA MENGGUNAKAN PADDING
    child: Padding(
      //PADDINGNYA DI-SET HANYA UNTUK TOP DAN LEFT
      padding: const EdgeInsets.only(top: 60, left: 20),
      //KARENA KITA AKAN MENAMPILKAN LEBIH DARI 1 OBJEK YANG BERUSUSUN KEBAWAH
      //MAKA KITA GUNAKAN COLUMN
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //BAGIAN INI NORMAL, HANYA MENAMPILKAN TEXT DENGAN STYLE MASING-MASING
          Text(
            "Anugrah Sandi",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "085343966997",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}
