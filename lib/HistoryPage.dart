import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ImagePage.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // ignore: prefer_final_fields
  Map<String, List<String>> _history = {
    "2024-07-20": [
      "https://picsum.photos/200/300",
      "https://picsum.photos/200/300",
      "https://picsum.photos/200/300",
    ],
    "2024-07-21": [
      "https://picsum.photos/200/300",
      "https://picsum.photos/200/300"
    ],
    "2024-07-22": [
      "https://picsum.photos/200/300",
      "https://picsum.photos/200/300"
    ],
  };

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  _loadHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> dates = [];
    if (prefs.containsKey('date')) {
      dates = prefs.getStringList('date')!;
      for (var date in dates) {
        _history[date] = List<String>.from(json.decode(prefs.getString(date)!));
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _history.length,
        itemBuilder: (BuildContext context, int index) {
          String date = _history.keys.elementAt(index);
          return Card(
            child: ListTile(
              title: Text(
                date,
                style: TextStyle(fontSize: 20),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.play_circle_fill_outlined),
                tooltip: 'Show Images',
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ImagePage(
                        title: date,
                        links: _history[date]!,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
