import 'package:flutter/material.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({Key? key}) : super(key: key);

  void onIconTap(int index) {
    print("Index $index");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.upload_file_rounded), label: 'Upload'),
        ],
        currentIndex: 0,
        onTap: onIconTap,
        selectedItemColor: Color.fromARGB(255, 81, 208, 24),
      ),
    );
  }
}
