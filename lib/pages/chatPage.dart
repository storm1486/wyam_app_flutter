import 'package:flutter/material.dart';

import '../services/chatUsersModel.dart';
import '../services/conversationList.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  List<ChatUsers> chatUsers = [
  ChatUsers(name: "Jane Russel", messageText: "Awesome Setup", image: "userImage1.jpg", time: "Now"),
  ChatUsers(name: "Glady's Murphy", messageText: "That's Great", image: "userImage2.jpg", time: "Yesterday"),
  ChatUsers(name: "Jorge Henry", messageText: "Hey where are you?", image: "userImage3.jpg", time: "31 Mar"),
  ChatUsers(name: "Philip Fox", messageText: "Busy! Call me in 20 mins", image: "userImage4.jpg", time: "28 Mar"),
  ChatUsers(name: "Debra Hawkins", messageText: "Thankyou, It's awesome", image: "userImage5.jpg", time: "23 Mar"),
  ChatUsers(name: "Jacob Pena", messageText: "will update you in evening", image: "userImage6.jpg", time: "17 Mar"),
  ChatUsers(name: "Andrey Jones", messageText: "Can you please share the file?", image: "userImage7.jpg", time: "24 Feb"),
  ChatUsers(name: "John Wick", messageText: "How are you?", image: "userImage8.jpg", time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
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
                            contentPadding: EdgeInsets.all(8),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade200,
                                )
                            ),
                          ),
                        ),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                    ],
                  ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Text("My Friends",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.blue[900]),),
                      Text('View All', style: TextStyle(fontSize: 15, color: Colors.blue[900]),)
                    ],
                  ),
                ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: ListView.builder(
                    itemCount: chatUsers.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 16),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return ConversationList(
                        name: chatUsers[index].name,
                        messageText: chatUsers[index].messageText,
                        image: 'assets/${chatUsers[index].image}',
                        time: chatUsers[index].time,
                        isMessageRead: (index == 0 || index == 3)?true:false,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}