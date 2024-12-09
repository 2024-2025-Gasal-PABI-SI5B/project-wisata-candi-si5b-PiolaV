// import 'package:flutter/material.dart';

// class SearchScreen extends StatelessWidget {
//   const SearchScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Search'),
//       ),
//       body: const Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Text('ini adalah halaman search uuuu'),
//         ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/models/candi.dart';
import 'package:wisata_candi/screens/detail_screen.dart'; // Import the DetailScreen

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Candi> filteredCandiList = candiList;
  TextEditingController searchController = TextEditingController();

  void filterSearchResults(String query) {
    List<Candi> dummySearchList = [];
    dummySearchList.addAll(candiList);
    if (query.isNotEmpty) {
      List<Candi> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        filteredCandiList = dummyListData;
      });
      return;
    } else {
      setState(() {
        filteredCandiList = candiList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                filterSearchResults(value);
              },
              decoration: const InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCandiList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(filteredCandiList[index].imageAsset),
                  title: Text(filteredCandiList[index].name),
                  subtitle: Text(filteredCandiList[index].location),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(candi: filteredCandiList[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}