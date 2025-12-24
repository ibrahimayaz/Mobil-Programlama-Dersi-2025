import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedPage = "Ana Sayfa";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPage),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Menü",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text("Ana Sayfa"),
              onTap: () {
                setState(() {
                  selectedPage = "Ana Sayfa";
                });
                Navigator.pop(context); // Drawer'ı kapatır
              },
            ),
            ListTile(
              title: const Text("Profil"),
              onTap: () {
                setState(() {
                  selectedPage = "Profil";
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Ayarlar"),
              onTap: () {
                setState(() {
                  selectedPage = "Ayarlar";
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          selectedPage,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
