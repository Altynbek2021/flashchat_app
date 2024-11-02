import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchatapp/constant.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChattingPage extends StatefulWidget {
  static const id = "ChattingPage";

  const ChattingPage({super.key});
  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final ScrollController _scrollController = ScrollController();
  late User loggedinUser;
  String messageText = "";

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      (e);
    }
  }

  void scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
          ),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: _firestore
                    .collection("messages")
                    .orderBy("timestamp")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasData) {
                    final messages = snapshot.data!.docs;
                    WidgetsBinding.instance
                        .addPostFrameCallback((_) => scrollToBottom());

                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final data = messages[index].data();
                        final sender = data['sender'] ?? 'Unknown';
                        final text = data['text'] ?? '';
                        final currentUser = loggedinUser.email;
                        bool isMe = currentUser == sender;

                        return BubbleMessage(
                            sender: sender, text: text, isMe: isMe);
                      },
                    );
                  }

                  return const Center(child: Text("No messages found"));
                },
              ),
            ),
            Container(
              decoration: kMessageContainerDecoration,
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (messageText.isNotEmpty) {
                        messageTextController.clear();
                        _firestore.collection("messages").add({
                          'text': messageText,
                          'sender': loggedinUser.email,
                          'timestamp': FieldValue.serverTimestamp(),
                        });
                      }
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BubbleMessage extends StatelessWidget {
  const BubbleMessage({
    super.key,
    required this.sender,
    required this.text,
    required this.isMe,
  });

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              sender,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
            Material(
              borderRadius: BorderRadius.only(
                topLeft: isMe ? const Radius.circular(30) : Radius.zero,
                topRight: isMe ? Radius.zero : const Radius.circular(30),
                bottomLeft: const Radius.circular(30),
                bottomRight: const Radius.circular(30),
              ),
              elevation: 5,
              color: isMe ? Colors.lightBlueAccent : Colors.green,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
