import 'package:flutter/material.dart';

class MessageViewPage extends StatefulWidget {
  final String landlordName;
  const MessageViewPage({
    super.key,
    required this.landlordName,
  });

  @override
  State<MessageViewPage> createState() => _MessageViewPageState();
}

class _MessageViewPageState extends State<MessageViewPage> {
  final TextEditingController _messageController = TextEditingController();

  final List<Map<String, String>> messages = [
    {"text": "Hello! Is the apartment still available?", "type": "received"},
    {"text": "Yes, it is available. When would you like to view it?", "type": "sent"},
    {"text": "Tomorrow morning works for me.", "type": "received"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Text(
              widget.landlordName,
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // chat messages
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isSent = message["type"] == "sent";

                return Align(
                  alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    decoration: BoxDecoration(
                      color: isSent ? Colors.green[100] : Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(12),
                        topRight: const Radius.circular(12),
                        bottomLeft: Radius.circular(isSent ? 12 : 0),
                        bottomRight: Radius.circular(isSent ? 0 : 12),
                      ),
                    ),
                    child: Text(
                      message["text"]!,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // message input field
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      hintStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 14),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    if (_messageController.text.trim().isEmpty) return;
                    setState(() {
                      messages.add({"text": _messageController.text.trim(), "type": "sent"});
                      _messageController.clear();
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.send, color: Colors.white, size: 20),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

