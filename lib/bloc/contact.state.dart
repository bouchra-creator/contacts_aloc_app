import 'package:contact_block_app/enums/enums.dart';
import 'package:contact_block_app/model/contact.model.dart';

import 'contact.actions.dart';

class ContactState {
  List<Contact> conatacts;
  RequesteState requesteState;
  String errorMessage;
  ContactEvent currentEvent;
  ContactState(
      {this.conatacts,
        this.requesteState,
        this.errorMessage,
        this.currentEvent});
}