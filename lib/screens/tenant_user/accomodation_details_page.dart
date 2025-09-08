import 'package:flutter/material.dart';

class AccommodationDetailsPage extends StatelessWidget {
  final String title;
  final String location;
  final String price;
  final String owner;
  final int numberOfRooms;
  final int numberOfBathrooms;
  final int limitOfPeople;
  final List<String> amenities;
  final String description;
  final String image;

  const AccommodationDetailsPage({
    super.key,
    required this.title,
    required this.location,
    required this.price,
    required this.owner,
    required this.numberOfRooms,
    required this.numberOfBathrooms,
    required this.limitOfPeople,
    required this.amenities,
    required this.description,
    required this.image,
  });

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(   
              children: [
                Container(
                  decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              boxShadow: [
                BoxShadow(
                 color: Colors.black26,   
                 blurRadius: 12,          
                 spreadRadius: 2,         
                 offset: Offset(0, 6),   
              ),
            ],
          ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(80),  
                 ),
                child: Image.asset(
                  image,
                  width: double.infinity,
                  height: 400,
                  fit: BoxFit.cover,
                ),
                ),
                ),

                Positioned(
                  top: 10,
                  left: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      location,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                       ),
                    ),

                    const SizedBox(height: 12),

                  Text("Owner: $owner"),
                    Text("Number of Rooms: $numberOfRooms"),
                    Text("Number of Bathrooms: $numberOfBathrooms"),
                    Text("Limit of People: $limitOfPeople"),

                    const SizedBox(height: 16),
                    
                   const Text(
                      "Amenities",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 8), 

                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: amenities
                          .map((e) => Row(
                                children: [
                                  const Icon(Icons.thumb_up,
                                      size: 16, color: Colors.green),
                                  const SizedBox(width: 5),
                                  Text(e),
                                ],
                              ))
                          .toList(),
                    ),
                  const SizedBox(height: 16),

                    // Description
                    const Text(
                      "Description",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(description),       
                  ],
                ),
              ),
            ),

          Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        "Message Owner",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        "Add to Likes",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
          ],
              )
          )
          ]
        ),
      ),
    );
  }
}