import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_35/colors/color_palette.dart';
import 'package:pas_mobile_11pplg2_35/controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: Image.asset('lib/images/profile.jpeg').image,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                    "Zulfiqar Silmy Setiawan",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: ColorPalette.accentColor),
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text("05570@smkrus.sch.id",
                    style: TextStyle(color: Color.fromARGB(255, 198, 235, 96)),
                  ),
                ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Divider(),
          ),

          Card(
            color: ColorPalette.accentColor,
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Nama Lengkap"),
              subtitle: const Text("Zulfiqar Silmy Setiawan", style: TextStyle(color: Colors.black)),
            ),
          ),
          Card(
            color: ColorPalette.accentColor,
            child: ListTile(
              leading: const Icon(Icons.phone),
              title: const Text("Nomor Telepon"),
              subtitle: const Text("+62 891 9281 9283", style: TextStyle(color: Colors.black)),
            ),
          ),
          Card(
            color: ColorPalette.accentColor,
            child: ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Alamat"),
              subtitle: const Text("Jl. Sukun Raya Besito Gg. Teratai", style: TextStyle(color: Colors.black)),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Divider(),
          ),

          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorPalette.accentColor,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => controller.logout(),
            icon: const Icon(Icons.logout),
            label: const Text("Logout", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
