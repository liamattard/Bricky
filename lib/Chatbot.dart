import 'package:dialogflow/dialogflow.dart';
import 'package:flutter/material.dart';




class Chatbot extends StatefulWidget {
  @override
  _ChatbotState createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot>
    with TickerProviderStateMixin {
  List<ChatMessage> _messages = List<ChatMessage>();
  bool _isComposing = false;

  TextEditingController _controllerText = new TextEditingController();

  // DialogflowApi _dialog;

  @override
  void initState() {
    super.initState();
      //----------------------
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: new Text("Bricky"), centerTitle: true, backgroundColor: Colors.teal,),
      
        body: Column(
          children: <Widget>[
            _buildList(),
            Divider(height: 8.0, color: Theme.of(context).accentColor),
            _buildComposer()
          ],
        ));
  }

  _buildList() {
    return Flexible(
      child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          reverse: true,
          itemCount: _messages.length,
          itemBuilder: (_, index) {
            return Container(child: ChatMessageListItem(_messages[index]));
          }),
    );
  }

  _buildComposer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _controllerText,
              onChanged: (value) {
                setState(() {
                  _isComposing = _controllerText.text.length > 0;
                });
              },
              onSubmitted: _handleSubmit,
              decoration: InputDecoration.collapsed(hintText: "Chat with me!"),
            ),
          ),
          new IconButton(
            icon: Icon(Icons.send),
            onPressed:
            _isComposing ? () => _handleSubmit(_controllerText.text) : null,
          ),
        ],
      ),
    );
  }

  _handleSubmit(String value) {
    _controllerText.clear();
    _addMessage(
      text: value,
      name: "User",
      initials: ":)",
    );

    _requestChatBot(value);    //----------------------------------
  }
//-----------------------------------------
  _requestChatBot(String text) async {
    
    Dialogflow dialogflow = Dialogflow(token: "0499b23997e24eaead3cca18b21b8f91");
    AIResponse response = await dialogflow.sendQuery(text);
    print(response.getMessageResponse());

  
    
    _addMessage(
        name: "Bricky",
        initials: "B",
        bot: true,
        text: response.getMessageResponse());
        //  speak(response.getMessageResponse().toString());
  }
//-----------------------------------------
  

  void _addMessage(
      {String name, String initials, bool bot = false, String text}) {
    var animationController = AnimationController(
      duration: new Duration(milliseconds: 700),
      vsync: this,
    );

    var message = ChatMessage(
        name: name,
        text: text,
        initials: initials,
        bot: bot,
        animationController: animationController);

    setState(() {
      _messages.insert(0, message);
    });

    animationController.forward();
  }
}

class ChatMessage {
  final String name;
  final String initials;
  final String text;
  final bool bot;

  AnimationController animationController;

  ChatMessage(
      {this.name,
        this.initials,
        this.text,
        this.bot = false,
        this.animationController});
}

class ChatMessageListItem extends StatelessWidget {
  final ChatMessage chatMessage;

  ChatMessageListItem(this.chatMessage);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
          parent: chatMessage.animationController, curve: Curves.easeOut),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CircleAvatar(
                child: Text(chatMessage.initials ?? "JD"),
                backgroundColor: chatMessage.bot
                    ? Theme.of(context).accentColor
                    : Theme.of(context).highlightColor,
              ),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(left: 16.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(chatMessage.name ?? "Jane Doe",
                        style: Theme.of(context).textTheme.subhead),
                    Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: Text(chatMessage.text)
                    )
                  ],
                ))
            )
          ],
        ),
      ),
    );
  }
}
