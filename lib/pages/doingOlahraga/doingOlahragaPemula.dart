import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uas_mob/pages/pemulaPage.dart';

class DoingOlahraga extends StatefulWidget {
  const DoingOlahraga({super.key});

  @override
  State<DoingOlahraga> createState() => _DoingOlahragaState();
}

class Olahraga {
  String? nama;
  String? jumlah;

  Olahraga({required String this.nama, required String this.jumlah});
}

class _DoingOlahragaState extends State<DoingOlahraga> {
  List<Olahraga> olahraga = [
    Olahraga(nama: "Push Up", jumlah: "x10"),
    Olahraga(nama: "Squat", jumlah: "x20"),
    Olahraga(nama: "Sit Up", jumlah: "x10"),
    Olahraga(nama: "Plank", jumlah: "30 detik"),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: width,
            height: height * 0.5,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/exercise3.jpg'),
                    fit: BoxFit.contain)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${olahraga[index].nama}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(height: 30),
              Text(
                '${olahraga[index].jumlah}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: width * 0.6,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        elevation: 0,
                        padding: const EdgeInsets.all(10)),
                    onPressed: () {
                      if (index < olahraga.length - 1) {
                        setState(() {
                          index++;
                        });
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(Icons.check),
                        const Text("SELESAI")
                      ],
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: width * 0.6,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        elevation: 0,
                        padding: const EdgeInsets.all(10)),
                    onPressed: () {
                      if (index > 0) {
                        setState(() {
                          index--;
                        });
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(Icons.arrow_back),
                        const Text("SEBELUM")
                      ],
                    )),
              )
            ],
          ),
          const SizedBox(height: 15),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PemulaPage()));
              },
              child: const Text(
                "Kembali",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ))
        ],
      ),
    );
  }
}