import 'dart:io';

import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {

final _textController= TextEditingController();
final _focusNode = new FocusNode();

List<ChatMessage>_messages = [
  
];

bool _estaEscribiendo=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Column(
            mainAxisAlignment :  MainAxisAlignment.center,
            children: [
              SizedBox(height: 3,),
              CircleAvatar(
                child: (Text('Te', style: TextStyle(fontSize: 12))),
                backgroundColor: Colors.blue[400],
                maxRadius: 14,
                ),
              
              SizedBox(height: 3,),
              Text('Melissa Flores', style:TextStyle(fontSize: 12, color:Colors.black87)),
              SizedBox(height: 3,),
              
            ],
          ),
         
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (_, i)=> _messages[i],
                reverse: true,
                )
                ),
            Divider(height: 1,),
            Container(
              color:Colors.white,
              child: _inputChat(),
            )
          ],
        )
     ),
   );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child:Row(
          children: [

            Flexible(
              child: TextField(
                controller:_textController,
                onSubmitted: _handleSubmit,
                onChanged: (String texto){
                  setState((){

                    if(texto.trim().length>0){
                      _estaEscribiendo=true;
                    }else{
                      _estaEscribiendo=false;
                    }


                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Enviar mensaje'
                ),
                focusNode: _focusNode,
              ),
              ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS 
              ? CupertinoButton(
                child: Text('Enviar'), 
                onPressed:  _estaEscribiendo
                     ? ()=> _handleSubmit(_textController.text.trim())
                     : null,
                     )
              : Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child: IconTheme(
                  data: IconThemeData(color:Colors.blue[400]),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                     icon: Icon(Icons.send, ),
                     onPressed: _estaEscribiendo
                     ? ()=> _handleSubmit(_textController.text.trim())
                     : null,
                     ),
                )
                ),
            )


        ],)
      ));
  }


_handleSubmit(String texto){
    if(texto.length==0) return;
    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = new ChatMessage(
      texto: texto, 
      uid: '123',
      animationController: AnimationController(vsync: this, duration:Duration(milliseconds: 200)),
      );
    _messages.insert(0,newMessage);
    newMessage.animationController.forward();
    setState(() {
      _estaEscribiendo=false;
    });
}

@override
  void dispose() {
    // TODO: Off socket

    for(ChatMessage message in _messages){
      message.animationController.dispose();
    }
    super.dispose();
  }


}