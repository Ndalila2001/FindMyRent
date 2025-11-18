// ignore_for_file: deprecated_member_use

import 'package:find_my_rent/screens/reusable_widgets/custom_nav_bar.dart';
import 'package:find_my_rent/screens/reusable_widgets/place_card.dart';
import 'package:flutter/material.dart';

class TenantHomePage extends StatefulWidget {

  const TenantHomePage({super.key});

  @override
  State<TenantHomePage> createState() => _TenantHomePageState();
}

class _TenantHomePageState extends State<TenantHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Greeting 
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text Section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello,",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.green[600],
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Let's find the best accomodation for you.",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      //Profile Icon
                      const CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),

                //  Search Bar
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search For a Specific Place",
                      hintStyle: const TextStyle(fontSize: 14),
                      prefixIcon: const Icon(Icons.search, color: Colors.black),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                      ),
                    ),
                  ),
                ),

                // Filter Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterChip("Bachelor Flat"),
                        const SizedBox(width: 8),
                        _buildFilterChip("Student Accomodation"),
                        const SizedBox(width: 8),
                        _buildFilterChip("2+ Bedroom Flat"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Section Title
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Showing Nearby Places",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Grid
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 100,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.85,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return const PlaceCard();
                    },
                  ),
                ),
              ],
            ),
          ),

          
        ],
        
      ),
       bottomNavigationBar: CustomNavBar(
    selectedIndex: 0, 
    onItemTapped: (index) {
      if (index==1) {
        Navigator.pushReplacementNamed(context, "/likes");
      } else if (index==2) {
        Navigator.pushReplacementNamed(context, "/messages");
      } else if (index==3) {
        Navigator.pushReplacementNamed(context, "/profile");
      }
      
    },
     )
      
    );
  }

 
  Widget _buildFilterChip(String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }

  // Place Card Widget

}
