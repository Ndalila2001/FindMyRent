// ignore_for_file: deprecated_member_use

import 'package:find_my_rent/screens/tenant_user/accomodation_details_page.dart';
import 'package:flutter/material.dart';


class PlaceCard extends StatelessWidget {
  const PlaceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector (
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AccommodationDetailsPage( //temporary data
              title: "Bachelor Flat", 
              location: "Khomasdal 28, Windhoek, Namibia", 
              price: "N\$ 3,200", 
              owner: "Barthromew M. Mufaya", 
              numberOfRooms: 1, 
              numberOfBathrooms: 1, 
              limitOfPeople: 1, 
              amenities:  [
                "Pet Friendly",
                "Wi-Fi",
                "Parking",
                "Built In Cupboard",
                "Built In Stove",
              ], 
              description: "Bachelor Flat available for rent in khomasdal 28. Contact owner for viewings. No deposit." , 
              image: "assets/images/login_background.jpg", // temporary image 
            ),
          ),
        );
      },

      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage("assets/images/login_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const Positioned(
            top: 8,
            right: 8,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.favorite_border, color: Colors.black),
            ),
            ),

            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(8),
                ),

               child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bachelor Flat",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    "Flat",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14, color: Colors.green),
                      SizedBox(width: 4),
                      Text(
                        "Windhoek",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],  
              )
            )
          )
        ]
        )
    ); 
 }

} 