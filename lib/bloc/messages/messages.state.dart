import 'package:contact_block_app/bloc/messages/messages.action.dart';
import 'package:contact_block_app/enums/enums.dart';
import 'package:contact_block_app/model/message.model.dart';

class MessageState {
  RequesteState requesteState;
  List<Message> messages;
  String messageError;
  MessageEvent currentEvent;
  List<Message> selectedMessages = [];

  MessageState(
      {this.requesteState,
        this.currentEvent,
        this.messageError,
        this.messages,
        this.selectedMessages});

  MessageState.initialState()
      : requesteState = RequesteState.NONE,
        messages = [],
        messageError = '',
        currentEvent = null,
        selectedMessages = [];
}