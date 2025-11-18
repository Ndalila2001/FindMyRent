// ignore_for_file: deprecated_member_use

import 'package:find_my_rent/screens/reusable_widgets/custom_nav_bar.dart';
import 'package:find_my_rent/screens/tenant_user/likesservice.dart';
import 'package:flutter/material.dart';

class LikesPage extends StatelessWidget {
  const LikesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final likedPlaces = LikesService.likedPlaces;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "Liked Places",
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: likedPlaces.isEmpty
          ? const Center(
              child: Text(
                "No liked places yet.",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: likedPlaces.length,
              itemBuilder: (context, index) {
                final Map<String, dynamic> place = likedPlaces[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.vertical(top: Radius.circular(15)),
                        child: place["image"] != null
                            ? Image.network(
                                place["image"] as String,
                                height: 160,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                height: 160,
                                width: double.infinity,
                                color: Colors.grey.shade200,
                                child: const Icon(Icons.image_not_supported),
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    place["name"]?.toString() ?? "Unnamed Place",
                                    style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    place["location"]?.toString() ??
                                        "Unknown location",
                                    style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    place["price"]?.toString() ?? "",
                                    style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.favorite,
                                color: Colors.red, size: 26),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: 1,
        onItemTapped: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, "/home");
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, "/messages");
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, "/profile");
          }
        },
      ),
    );
  }
}
