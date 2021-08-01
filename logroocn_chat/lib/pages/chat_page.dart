import 'package:flutter/material.dart';
import 'package:logroocn_chat/models/chat_user_models.dart';
import 'package:logroocn_chat/widgets/talk_list.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "Joker",
        messageText: "Мы тут с пацанами пошли бетмена ловить",
        imageURL: "images/userImage1.jpg",
        time: "Now"),
    ChatUsers(
        name: "Ральф",
        messageText: "Еду домой",
        imageURL: "images/userImage2.jpg",
        time: "Yesterday"),
    ChatUsers(
        name: "Мефистофель",
        messageText:
            "Я часть той силы, что вечно жаждет зла, но совершает благо",
        imageURL: "images/userImage3.jpg",
        time: "31 Mar"),
    ChatUsers(
        name: "Санни",
        messageText: "Я не хочу умирать...",
        imageURL: "images/userImage4.jpg",
        time: "28 Mar"),
    ChatUsers(
        name: "Rabbit MQ",
        messageText: "Наплодим очередей?",
        imageURL: "images/userImage5.jpg",
        time: "23 Mar"),
    ChatUsers(
        name: "Бетмен",
        messageText: "Что там Joker опять удумал???",
        imageURL: "images/userImage6.jpg",
        time: "17 Mar"),
    ChatUsers(
        name: "Инженеры",
        messageText: "Can you please share the file?",
        imageURL: "images/userImage7.jpg",
        time: "24 Feb"),
    ChatUsers(
        name: "Заказчик",
        messageText: "А точно нельзя нарисовать красные линии зеленым цветом?",
        imageURL: "images/userImage8.jpg",
        time: "18 Feb"),
  ];

  Widget _serachBar() {
    return Padding(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Поиск",
          hintStyle: TextStyle(color: Colors.grey.shade600),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade600,
            size: 20,
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: EdgeInsets.all(8),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade100)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Сообщения",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            color: Colors.pink,
                            size: 20,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Начать новый диалог",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            _serachBar(),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageUrl: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
