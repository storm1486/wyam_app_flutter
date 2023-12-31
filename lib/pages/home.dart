import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wyam_app/services/choose_location.dart';
import 'package:wyam_app/services/horizontalScroller.dart';
import 'applications.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? selectedType;
  String? selectedSortOrder;
  final List<String> sortOptions = ['Nearest', 'Farthest'];

  void _onFilterChanged(String type) {
    setState(() {
      if (selectedType == type) {
        selectedType = null;
      } else {
        selectedType = type;
      }

      sortLocations(selectedSortOrder!);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search for a person or message",
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          prefixIcon: Icon(Icons.search,color: Colors.grey[600], size: 20,),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          contentPadding: const EdgeInsets.all(8),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.grey.shade200,
                              )
                          ),
                        ),
                      ),
                    ),
                    IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Applications()));},
                        icon: const Icon(Icons.edit, color: Colors.black,))
                  ],
                ),
              ),
            ),
            // scroller feature
            HorizontalScroller(
              items: const [
                'All',
                'Food',
                'Shelter',
                'Hygiene',
                'Health',
                'Work & Learn',
                'Finance',
                'Other',
              ],
              onItemSelected: _onFilterChanged,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: DropdownButton(
                  borderRadius: BorderRadius.circular(10),
                  value: selectedSortOrder,
                  hint: Text('Sort by'),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedSortOrder = newValue;
                    });
                  },
                  items: sortOptions.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            Expanded(
              child: ChooseLocation(selectedType: selectedType),
            ),
          ],
        ),
    );
  }
}
