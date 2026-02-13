import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Messageview extends StatefulWidget {
  const Messageview({super.key, required this.heroTag});

  final String heroTag;

  @override
  State<Messageview> createState() => _MessageviewState();
}

class ChatMessage {
  ChatMessage({
    required this.text,
    required this.time,
    required this.isSender,
  });

  final String text;
  final String time;
  final bool isSender;
}

class ChatDay {
  ChatDay({required this.label, required this.messages});

  final String label;
  final List<ChatMessage> messages;
}

class _MessageviewState extends State<Messageview> {
  final List<ChatDay> _days = [
    ChatDay(
      label: '30 Jan 2024',
      messages: [
        ChatMessage(
          text: "Hey, I'm interested in the property! Is it still available?",
          time: '2:45 PM',
          isSender: true,
        ),
        ChatMessage(
          text:
              'Hi! Yes, the property is still available. Let me know if you have any questions or would like to schedule a viewing.',
          time: '2:46 PM',
          isSender: false,
        ),
        ChatMessage(
          text: '😀 😀',
          time: '2:50 PM',
          isSender: true,
        ),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Center(
          child: Hero(
            tag: widget.heroTag,
            child: Material(
              color: Colors.transparent,
              child: Container(
                height: 800.h,
                width: 420.w,
                margin: EdgeInsets.only(bottom: 80.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.surface,
                    width: 2.w,
                  ),
                ),
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  children: [
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Text(
                          'Messages',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      radius: 60.r,
                    ),
                    SizedBox(height: 10.h),
                    Center(
                      child: Text(
                        'User Name',
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          height: 0.8.h,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Property Name',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Poppins',
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Center(
                      child: Text(
                        'N\$ 3000/ month',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Clarendon',
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    ..._buildMessageList(),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMessageList() {
    final widgets = <Widget>[];
    for (final day in _days) {
      widgets.add(_buildDateHeader(day.label));
      widgets.add(SizedBox(height: 12.h));
      for (final message in day.messages) {
        widgets.add(_buildMessageBubble(message));
        widgets.add(SizedBox(height: 12.h));
      }
    }
    return widgets;
  }

  Widget _buildDateHeader(String label) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10).r,
            child: Divider(
              color: Theme.of(context).colorScheme.surface,
              thickness: 2.h,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 10).r,
            child: Divider(
              color: Theme.of(context).colorScheme.surface,
              thickness: 2.h,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    final isEmojiOnly = _isEmojiOnly(message.text);
    final textStyle = TextStyle(
      fontSize: isEmojiOnly ? 60.sp : 14.sp,
      fontFamily: 'Poppins',
      fontWeight: message.isSender ? FontWeight.normal : FontWeight.bold,
      color: Theme.of(context).colorScheme.surface,
    );

    return Align(
      alignment:
          message.isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 280.w),
        child: Column(
          crossAxisAlignment: message.isSender
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(message.text, style: textStyle),
            SizedBox(height: 4.h),
            Text(
              message.time,
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isEmojiOnly(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) {
      return false;
    }

    final hasLettersOrDigits = RegExp(r'[A-Za-z0-9]').hasMatch(trimmed);
    if (hasLettersOrDigits) {
      return false;
    }

    final tokens = trimmed.split(RegExp(r'\s+'));
    if (tokens.length > 2) {
      return false;
    }

    return tokens.every((token) => token.runes.length <= 4);
  }
}
