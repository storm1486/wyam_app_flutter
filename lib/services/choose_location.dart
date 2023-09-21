import 'package:flutter/material.dart';
import 'package:wyam_app/services/amenities.dart';

class ChooseLocation extends StatefulWidget {
  final String? selectedType;

  const ChooseLocation({super.key, required this.selectedType});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  Map<String, List<String>> typeMapping = {
    "All": ["All"],
    "Food": ["Food"],
    "Shelter": ["Shelter"],
    "Hygiene": ["Hygiene"],
    "Health": ["Health"],
    "Work & Learn": ["Work", "Learn"],
    "Finance": ["Finance"],
    "Other": ["Other"],
  };

  List<Amenities> locations = [
    Amenities(location: 'Location 1', hours: '7:00 am - 8:00 pm', image: 'location1.jpg', appointments: '2', type: 'Food'),
    Amenities(location: 'Location 2', hours: '24 hours', image: 'location2.jpg', appointments: '3', type: 'Hygiene'),
    Amenities(location: 'Location 3', hours: '10:00 am - 3:00 pm', image: 'location3.jpg', appointments: '0', type: 'Finance'),
    Amenities(location: 'Location 4', hours: '12:00 pm - 9:00 pm', image: 'location4.jpg', appointments: '5', type: 'Work'),
    Amenities(location: 'Location 5', hours: '7:00 am - 10:00 pm', image: 'location5.jpg', appointments: '7', type: 'Learn'),
    Amenities(location: 'Location 6', hours: '5:00 am - 2:00 am', image: 'location6.jpg', appointments: '1', type: 'Shelter'),
    Amenities(location: 'Location 7', hours: '2:00 pm - 11:00 pm', image: 'location7.jpg', appointments: '30', type: 'Other'),
    Amenities(location: 'Location 8', hours: '1:00 pm - 5:00 pm', image: 'location8.jpg', appointments: '0', type: 'Health'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                  child: Text(
                    'Sort by',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
               ],
            ),
            ListView.builder(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: locations.length,
              itemBuilder: (context, index) {
                List<String>? mappedTypes = typeMapping[widget.selectedType ?? "All"];
                //Display the locations depending on the type parameter
                if (widget.selectedType != null && !mappedTypes!.contains(locations[index].type) && !mappedTypes.contains("All")) {
                  return SizedBox.shrink();  // Do not display items that don't match the type
                }
                //Determine the color based on number of appointments
                Color? availabilityColor = locations[index].appointments == '0'
                    ? Colors.grey // Set to red for zero appointments
                    : Colors.cyan[800]; // Set to blue for non-zero appointments
                // Determine the text based on the number of appointments
                String availabilityText = locations[index].appointments == '0'
                    ? "Unavailable" // Display when there are no appointments
                    : "${locations[index].appointments} Available"; // Display when there are appointments
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Container(
                            height: 125,
                            // background image for each card
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/${locations[index].image}'),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.white.withOpacity(.25),
                                    BlendMode.dstATop,
                                  )
                              ),
                            ),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              onTap: () {},
                              title: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                child: Text(locations[index].location, style: TextStyle(fontSize: 20)),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(locations[index].address),
                                    // Text(locations[index].distance),
                                    Text(locations[index].hours),
                                  ],
                                ),
                              ),
                              tileColor: Colors.transparent,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: SizedBox(
                              height: 25,
                              width: 80,
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    color: availabilityColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                        availabilityText,
                                        style: const TextStyle(fontSize: 12, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
                },
            ),
          ],
        ),
      ),
    );
  }
}
