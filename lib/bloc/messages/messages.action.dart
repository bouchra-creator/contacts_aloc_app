import 'package:contact_block_app/model/contact.model.dart';
import 'package:contact_block_app/model/message.model.dart';

abstract class MessageEvent<T> {
  T payLoad;
  MessageEvent({this.payLoad});
}

class MessageByContactEvent extends MessageEvent<Contact> {
  MessageByContactEvent(Contact payLoad) : super(payLoad: payLoad);
}

class AddNewMessageEvent extends MessageEvent<Message> {
  AddNewMessageEvent(Message payLoad) : super(payLoad: payLoad);
}

class SelectMessageEvent extends MessageEvent<Message> {
  SelectMessageEvent(Message payLoad) : super(payLoad: payLoad);
}

class DeleteMessageEvent extends MessageEvent {
  DeleteMessageEvent() : super(payLoad: null);
}