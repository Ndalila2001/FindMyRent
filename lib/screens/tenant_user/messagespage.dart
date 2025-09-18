// ignore_for_file: deprecated_member_use

import 'package:find_my_rent/screens/reusable_widgets/custom_nav_bar.dart';
import 'package:find_my_rent/screens/tenant_user/messagesview.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  // sample chat data
  final List<Map<String, String>> chats = [
    {
      "name": "John Landlord",
      "lastMessage": "Hi, the apartment is still available.",
      "time": "10:30 AM",
    },
    {
      "name": "Sarah Smith",
      "lastMessage": "Can you send me your documents?",
      "time": "Yesterday",
    },
    {
      "name": "Michael Johnson",
      "lastMessage": "When would you like to come for viewing?",
      "time": "Mon",
    },
  ];

  // Track unread status
  final List<bool> unread = [true, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "Messages",
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];

          return GestureDetector(
            onTap: () {
              // mark chat as read
              setState(() {
                unread[index] = false;
              });
              
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MessageViewPage(landlordName: "name")));
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // profile picture
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // chats
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chat["name"]!,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          chat["lastMessage"]!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // time and unread dot
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        chat["time"]!,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Colors.grey[500],
                        ),
                      ),
                      if (unread[index]) ...[
                          const SizedBox(width: 4),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ]
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: 2,
        onItemTapped: (index) {
          if (index==0) {
            Navigator.pushReplacementNamed(context, "/home");
          } else if (index==1) {
            Navigator.pushReplacementNamed(context, "/likes");
          } else if (index==3) {
            Navigator.pushReplacementNamed(context, "/profile");
          }
        },
      ),
    );
  }
}
